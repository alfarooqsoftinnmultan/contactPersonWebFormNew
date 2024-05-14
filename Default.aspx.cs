using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;

namespace contactPersonWebFormNew
{
    public partial class _Default : Page
    {
        string connString = "SERVER=.\\sqlexpress;Database=contacts;User Id=sa;Password=remote;MultipleActiveResultSets=true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                getdata();
                fillStates();
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            string sql = "";

            if (txtName.Text == "")
            {
                txtName.Focus();
                Response.Write("<script> alert('invalid Name') </script>");
                return;
            }
            if (txtLastName.Text == "")
            {
                txtLastName.Focus();
                Response.Write("<script> alert('invalid Last Name') </script>");
                return;
            }
            if (txtPhoneNo.Text == "")
            {
                txtPhoneNo.Focus();
                Response.Write("<script> alert('invalid phone No.') </script>");
                return;
            }
            if (txtEmail.Text == "")
            {
                txtEmail.Focus();
                Response.Write("<script> alert('invalid email') </script>");
                return;
            }
            if (ddState.SelectedValue == "")
            {
                ddState.Focus();
                Response.Write("<script> alert('invalid state selection') </script>");
                return;
            }

            if (txtCode.Text != "")
            {
                sql = "";
                sql = sql + " update persons set person_name='" + txtName.Text + "'";
                sql = sql + " , person_last_name='" + txtLastName.Text.Trim() + "'";
                sql = sql + " , phone_no='" + txtPhoneNo.Text.Trim() + "'";
                sql = sql + " , email='" + txtEmail.Text.Trim() + "'";
                sql = sql + " , gender='" + txtGender.Text.Trim() + "'";
                sql = sql + " , state_id='" + ddState.SelectedValue + "'";
                sql = sql + " , city_id='" + ddCities.SelectedValue + "'";
                sql = sql + " where person_id=" + txtCode.Text;
            }
            else
            {
                sql = "";
                sql = sql + " insert into persons (person_name, person_last_name, phone_no, email, gender)";
                sql = sql + " values (";
                sql = sql + "'" + txtName.Text + "',";
                sql = sql + "'" + txtLastName.Text + "',";
                sql = sql + "'" + txtPhoneNo.Text + "',";
                sql = sql + "'" + txtEmail.Text + "',";
                sql = sql + "'" + txtGender.Text + "'";
                sql = sql + " )";
            }
            try
            {
                //-----------------------------------
                using (SqlConnection con = new SqlConnection(connString))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        int m = cmd.ExecuteNonQuery(); 
                        con.Close();
                        getdata();
                    }
                }
            }
            catch (Exception er)
            {
                var err = er.Message;
            }



        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (txtCode.Text == "")
            {
                txtName.Focus();
                Response.Write("<script> alert('invalid record to delete') </script>");
                return;
            }


            string sql = "";
            sql = "delete from persons where person_id=" + txtCode.Text;
            try
            {
                //-----------------------------------
                using (SqlConnection con = new SqlConnection(connString))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        int m = cmd.ExecuteNonQuery();
                        con.Close();
                        getdata();
                    }
                }
            }
            catch (Exception er)
            {
                var err = er.Message;
            }



        }


        protected void btnNew_Click(object sender, EventArgs e)
        {

            string sql = "";
            sql = "delete from persons where person_id=" + txtCode.Text;
            try
            {
                getdata();
            }
            catch (Exception er)
            {
                var err = er.Message;
            }



        }


        public void getdata()
        {
            txtName.Focus();
            txtCode.Text = "";
            txtName.Text = "";
            txtLastName.Text = "";
            txtPhoneNo.Text = "";
            txtEmail.Text = "";
            txtGender.Text = "Male";
            ddState.Text = "";
            ddState.SelectedValue = "-1";
            ddState.ClearSelection();
            ddState.SelectedIndex = -1;
            ddCities.Text = "";
            ddCities.ClearSelection();

            string sql = "";
            sql = sql + " select p.person_id as Id, p.person_name as [Name], p.person_last_name as [Last Name], p.phone_no as Phone, p.Email, p.Gender ";
            sql = sql + " , p.state_id, s.state_name, p.city_id, c.city_name ";
            sql = sql + " from persons p ";
            sql = sql + " left outer join states s on s.state_id=p.state_id ";
            sql = sql + " left outer join cities c on c.city_id=p.city_id ";
            try
            {
                //-----------------------------------
                using (SqlConnection con = new SqlConnection(connString))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        GridView1.DataSource = ds;
                        GridView1.DataBind();
                        con.Close();
                    }
                }
            }
            catch (Exception e)
            {
                var err = e.Message;
            }
        }



        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            txtCode.Text = row.Cells[1].Text;
            txtName.Text = row.Cells[2].Text;
            txtLastName.Text = row.Cells[3].Text;
            txtPhoneNo.Text = row.Cells[4].Text;
            txtEmail.Text = row.Cells[5].Text;
            txtGender.Text = row.Cells[6].Text;
            string test = row.Cells[7].Text;

            if (row.Cells[7].Text !=null)
            {
                ddState.SelectedValue = row.Cells[7].Text;
                fillCities();
            }
            if (row.Cells[9].Text != null)
            {
                ddCities.SelectedValue = row.Cells[9].Text;
            }

            txtName.Focus();

        }




        public void fillStates()
        {
            DataSet ds = new DataSet();
            string sql = "";
            sql = "select state_id, state_name from states";
            try
            {
                //-----------------------------------
                using (SqlConnection con = new SqlConnection(connString))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.CommandTimeout = 600;
                        cmd.CommandType = CommandType.Text;
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(ds);
                        con.Close();
                        ddState.DataSource = ds.Tables[0];
                        ddState.DataTextField = "state_name";
                        ddState.DataValueField = "state_id";
                        ddState.DataBind();
                    }
                }
                //ddState.Items.Add("select state",0);
                //ddState.Items.Insert(0, new ListItem("--- New First Item---", "-1"));
            }
            catch (Exception e)
            {
                var err = e.Message;
            }
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            fillCities();
        }


        public void fillCities()
        {
            if (ddState.SelectedValue != "")
            {
                DataSet ds = new DataSet();
                string sql = "";
                sql = "select city_id, city_name from cities where state_id=" + ddState.SelectedValue;
                try
                {
                    //-----------------------------------
                    using (SqlConnection con = new SqlConnection(connString))
                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand(sql, con))
                        {
                            cmd.CommandTimeout = 600;
                            cmd.CommandType = CommandType.Text;
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            da.Fill(ds);
                            con.Close();
                            ddCities.DataSource = ds.Tables[0];
                            ddCities.DataTextField = "city_name";
                            ddCities.DataValueField = "city_id";
                            ddCities.DataBind();
                        }
                    }
                }
                catch (Exception er)
                {
                    var err = er.Message;
                }
            }

        }

        //----------- end of page---------------------------

    }
}