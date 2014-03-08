package br.com.wakim.index.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DataSetDAO extends JDBCUtils {
	
	static final String countSubQuery = "SELECT COUNT(1) FROM ir.document WHERE dataSet_id = ?";
	static final String queryDataSet = "SELECT id, name, (" + countSubQuery + ") size FROM ir.dataset WHERE id = ? ORDER BY id desc";
	
	public DataSet getDataSet(int dataSetId) {
		ResultSet rs = null;
		PreparedStatement statement = null;
		Connection con = null;
		
		try {
			con = getConnection();
			
			statement = con.prepareStatement(queryDataSet);
			
			statement.setInt(1, dataSetId);
			statement.setInt(2, dataSetId);
			
			rs = statement.executeQuery();
			
			DataSet set = null;
			
			if(rs.next()) {
				set = new DataSet();
				
				set.id = rs.getInt(1);
				set.name = rs.getString(2);
				set.size = rs.getInt(3);
			}
			
			return set;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			if(statement != null) {
				
				try {
					rs.close();
					statement.close();
					getConnection().close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
