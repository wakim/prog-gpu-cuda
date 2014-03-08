package br.com.wakim.index.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class DocumentDAO extends JDBCUtils {
	
	static final String queryDocumentsWithLimit = "SELECT body FROM ir.document WHERE dataSet_id = ? ORDER BY id desc LIMIT ?";
	static final String queryDocuments = "SELECT body FROM ir.document WHERE dataSet_id = ? ORDER BY id desc";
	static final String countDocuments = "SELECT count(1) FROM ir.document WHERE dataSet_id = ? ORDER BY id desc";
	
	public List<String> getDocuments(int dataSetId, int limit) {
		ResultSet rs = null;
		PreparedStatement statement = null;
		Connection con = null;
		
		try {
			con = getConnection();
			
			statement = con.prepareStatement(queryDocumentsWithLimit);
			
			statement.setInt(1, dataSetId);
			statement.setInt(2, limit);
			
			rs = statement.executeQuery();
			
			return getDocuments(rs, 1);
		} catch (SQLException e) {
			e.printStackTrace();
			return Collections.emptyList();
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
	
	public List<String> getDocuments(int dataSetId) {
		ResultSet rs = null;
		PreparedStatement statement = null;
		Connection con = null;
		
		try {
			con = getConnection();
			
			statement = con.prepareStatement(queryDocuments);
			
			statement.setInt(1, dataSetId);
			
			rs = statement.executeQuery();
			
			return getDocuments(rs, 1);
		} catch (SQLException e) {
			e.printStackTrace();
			return Collections.emptyList();
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
	
	private List<String> getDocuments(ResultSet rs, int column) throws SQLException {
		List<String> documents = new ArrayList<String>();
		
		while(rs.next()) {
			documents.add(rs.getString(column));
		}
		
		return documents;
	}
}
