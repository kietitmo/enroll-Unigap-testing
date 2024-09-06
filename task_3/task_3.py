import psycopg2
import json
import pandas as pd

def extract_data(file_path):
    try:
        with open(file_path, 'r') as file:
            data = json.load(file)
        return pd.DataFrame(data)
    except Exception as e:
        print(f"Error reading the JSON file: {e}")
        return pd.DataFrame()


def transform_data(df):
    try:
        df['join_date'] = pd.to_datetime(df['join_date'], errors='coerce').dt.date
        df = df[['id', 'name', 'department', 'salary', 'join_date']]
        df.dropna(inplace=True)
    except Exception as e:
        print(f"Error during data transformation: {e}")
    return df

def load_data(df):
    """Load data into the PostgreSQL database."""
    try:
        conn = psycopg2.connect(
        database="enroll_testing", user='username', password='password', host='localhost', port= '5433'
        )

        cursor = conn.cursor()

        # create table
        sql = '''create table if not exists employees(
            id integer primary key,
            name text,
            department text,
            salary numeric,
            join_date date
        )'''

        cursor.execute(sql)
        insert_query = """
            insert into employees (id, name, department, salary, join_date)
            values (%s, %s, %s, %s, %s);
        """

        # Insert data
        for _, row in df.iterrows():
            cursor.execute(insert_query, (row['id'], row['name'], row['department'], row['salary'], row['join_date']))

        conn.commit()
        cursor.close()
        conn.close()

    except Exception as e:
        print(f"Error loading data into the database: {e}")

if __name__ == "__main__":
    json_file_path = './task_3/employees.json'
    df = extract_data(json_file_path)
    df_tranformed = transform_data(df)
    load_data(df_tranformed)