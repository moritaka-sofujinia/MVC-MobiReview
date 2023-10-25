using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SQLite;
using System.Data;

namespace ReMoBi_DCSN.Controllers
{
    public sealed class SQLiteHandler
    {
        // for more information about the database, see the ScriptSQL.sql file

        private static SQLiteHandler instance;
        private static readonly object lockObject = new object();
        private SQLiteConnection connection;

        private SQLiteHandler()
        {
            string databasePath;

            // Check if ../../database.db exists, if not, check if database.db exists
            if (!System.IO.File.Exists("../../database.db") && !System.IO.File.Exists("database.db"))
            {
                SQLiteConnection.CreateFile("database.db");
            }

            // Set the appropriate database path based on existence
            // (condition) ? (if true) : (if false)
            databasePath = System.IO.File.Exists("../../database.db") ? "../../database.db" : "database.db";

            string connectionString = $"Data Source={databasePath};Version=3;";
            connection = new SQLiteConnection(connectionString);
        }


        public static SQLiteHandler Instance
        {
            get
            {
                if (instance == null)
                {
                    // Lock the object to prevent multiple threads from accessing it at the same time
                    lock (lockObject)
                    {
                        if (instance == null)
                        {
                            instance = new SQLiteHandler();
                        }
                    }
                }
                return instance;
            }
        }

        public void OpenConnection()
        {
            if (connection.State != System.Data.ConnectionState.Open)
            {
                connection.Open();
            }
        }

        public void CloseConnection()
        {
            if (connection.State != System.Data.ConnectionState.Closed)
            {
                connection.Close();
            }
        }
        // Execute a query that does not return any data
        public void ExecuteNonQuery(string query)
        {
            SQLiteCommand command = new SQLiteCommand(query, connection);
            command.ExecuteNonQuery();
        }
        // Execute a query that returns a single integer value
        public int IntExecuteScalar(string query)
        {
            SQLiteCommand command = new SQLiteCommand(query, connection);
            return Convert.ToInt32(command.ExecuteScalar());
        }
        // Execute a query that returns a single <T> value
        public T ExecuteScalar<T>(string query)
        {
            SQLiteCommand command = new SQLiteCommand(query, connection);
            return (T)command.ExecuteScalar();
            // can you use this for any type?
            // answer: yes, but you have to cast it to the type you want
            // for example: int i = ExecuteScalar<int>("SELECT COUNT(*) FROM table");
        }

        // Execute a query that returns a single string value
        public string StringExecuteScalar(string query)
        {
            SQLiteCommand command = new SQLiteCommand(query, connection);
            return command.ExecuteScalar().ToString();
        }

        // Execute a query that returns a single real value
        public double DoubleExecuteScalar(string query)
        {
            SQLiteCommand command = new SQLiteCommand(query, connection);
            return Convert.ToDouble(command.ExecuteScalar());
        }

        // Execute a query that returns a single row of data to a List<string>
        public List<string> GetASingleRowQuery(string query)
        {
            SQLiteCommand command = new SQLiteCommand(query, connection);
            SQLiteDataReader reader = command.ExecuteReader();
            List<string> result = new List<string>();
            while (reader.Read())
            {
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    result.Add(reader[i].ToString());
                }
            }
            return result;
        }

        // Execute a query that returns a single column of data to a List<string>
        public List<string> GetASingleColumnQuery(string query)
        {
            SQLiteCommand command = new SQLiteCommand(query, connection);
            SQLiteDataReader reader = command.ExecuteReader();
            List<string> result = new List<string>();
            while (reader.Read())
            {
                result.Add(reader[0].ToString());
            }
            return result;
        }


        // Execute a query that returns a table to DataTable
        public DataTable ExecuteQueryTable(string query)
        {
            SQLiteCommand command = new SQLiteCommand(query, connection);
            SQLiteDataReader reader = command.ExecuteReader();
            DataTable result = new DataTable();
            result.Load(reader);
            return result;
        }

    }
}