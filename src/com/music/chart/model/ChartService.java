package com.music.chart.model;

import java.sql.SQLException;
import java.util.List;

public class ChartService {
	ChartDAO dao=null;

	public ChartService() {
		dao=new ChartDAO();
	}
	
	public List<ChartVO> selectMonthChart() throws SQLException {
		return dao.searchMonthChart();
	}
	
	public List<ChartVO> selectTodayChart() throws SQLException {
		return dao.selectTodayChart();
	}
	
	public List<ChartVO> selectWeekChart() throws SQLException {
		return dao.selectWeekChart();
	}

	public List<ChartVO> selectTotalChart() throws SQLException {
		return dao.selectTotalChart();
	}
	
	
}
