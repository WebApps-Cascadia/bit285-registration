/**
* Fred Jaworski
* Assignment 2
* 2/26/2016
*
* Code for generating 5 unique passwords based on user input on the form.
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Password : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

		bool LoggedIn = (bool)Session["LoggedIn"];

		if (!LoggedIn)
		{
			Response.Redirect("Login.aspx");
		}

		// Fill in the form and labels based on information from previous page
		lastName.Text = (string)Session["lastName"];
		name.Text = hello.Text = (string)Session["firstName"];
		program.Text = (string)Session["program"];

		if (!String.IsNullOrWhiteSpace(((string)Session["email"])))
		{
			string emailText = "We'll send email updates to you at ";
			email.Text = emailText + (string)Session["email"];
			email.Visible = true;
		}
	}

	/// <summary>
	/// Main work horse for generating passwords
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	protected void suggest_Click(object sender, EventArgs e)
	{
		// Put the text from the textboxes into local variables and trim off whitespace
		string lastNameText = lastName.Text.Trim();
		string birthYearText = birthYear.Text.Trim();
		string favColorText = favColor.Text.Trim();

		// Check that each string is not null or only whitespace
		if (String.IsNullOrWhiteSpace(lastNameText) ||
			String.IsNullOrWhiteSpace(birthYearText) ||
			String.IsNullOrWhiteSpace(favColorText))
			return;

		// Clear TextBoxes
		lastName.Text = "";
		birthYear.Text = "";
		favColor.Text = "";

		// generate 5 unique passwords and store in array
		string[] passwordsList =
		{
			FluffTo8(FirstPass(lastNameText, favColorText)),
			FluffTo8(SecondPass(lastNameText, birthYearText, favColorText)),
			FluffTo8(ThirdPass(birthYearText, favColorText)),
			FluffTo8(FourthPass(lastNameText, birthYearText)),
			FluffTo8(FifthPass(lastNameText, favColorText))
		};

		// clear dropdownlist
		passwords.Items.Clear();

		// add passwords to dropdownlist
		foreach (string pass in passwordsList)
			passwords.Items.Add(pass);
	}

	/// <summary>
	/// adds data to a string so that it is at least 8 characters long
	/// </summary>
	/// <param name="pass">string to be fluffed</param>
	/// <returns>String that is atleast 8 characters long</returns>
	private string FluffTo8(string pass)
	{
		string s = pass;
		while (s.Length < 8)
		{
			if (s.Length > 5)
				s += "!!";
			else
				s += s;
		}

		return s;
	}

	/// <summary>
	/// Generates the first password
	/// </summary>
	/// <param name="lastName"></param>
	/// <param name="favColor"></param>
	/// <returns></returns>
	private string FirstPass(string lastName, string favColor)
	{
		string pass = ""; // container for password
		int half = lastName.Length / 2; // index of the halfway character in the entered last name

		// fills the first part of the password in with the first half of the last name
		for (int i = 0; i <= half; i++)
		{
			if (i == 0)
				pass += Char.ToUpper(lastName[i]);
			else
				pass += Char.ToLower(lastName[i]);
		}

		// adds the favorite color in the middle
		pass += favColor.ToLower();

		// adds the second half of the lastname to the password
		for (int i = half; i < lastName.Length; i++)
			pass += Char.ToLower(lastName[i]);

		return pass;
	}

	private string SecondPass(string lastName, string birthYear, string favColor)
	{
		string pass = ""; // container for password

		pass += birthYear; // adds birth year to password

		pass += favColor.ToLower(); // adds favorite color to password lower case

		pass += Char.ToUpper(lastName[0]); // adds upper case first character of the last name

		return pass;
	}

	private string ThirdPass(string birthYear, string favColor)
	{
		string pass = "";

		// halfway index of birthYear
		int half = birthYear.Length / 2;

		// adds first half of birthYear to password
		for (int i = 0; i < half; i++)
			pass += birthYear[i];

		pass += favColor; // adds favorite color to password

		// adds second half of BirthYear to password
		for (int i = half; i < birthYear.Length; i++)
			pass += birthYear[i];

		return pass;
	}

	private string FourthPass(string lastName, string birthYear)
	{
		string pass = "";

		// adds birthYear backwards to the password
		for (int i = birthYear.Length - 1; i >= 0; i--)
			pass += birthYear[i];

		// adds lastname to password with first character upper case
		for (int i = 0; i < lastName.Length; i++)
		{
			if (i == 0)
				pass += Char.ToUpper(lastName[i]);
			else
				pass += Char.ToLower(lastName[i]);
		}

		return pass;
	}

	private string FifthPass(string lastName, string favColor)
	{
		string pass = "";

		// add the first character to the password upper case
		pass += Char.ToUpper(lastName[0]);

		// add the favorite color three times to the password
		for (int i = 0; i < 3; i++)
			pass += favColor;

		return pass;
	}
}