package com.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.EmpDAO;
import com.model.Employee;

@Controller
public class Cont {
	EmpDAO aa;

	@Autowired
	public Cont(EmpDAO aaa) {
		this.aa = aaa;
	}

	ArrayList<Employee> ae;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String sai(Model model) {
		ae = (ArrayList<Employee>) aa.getAllEmployees();
		System.out.println(ae.get(0).getEName());
		model.addAttribute("elist", ae);
		return "emplist";
	}

	@PostMapping("/deleteEmployee")
	@ResponseBody
	public ResponseEntity<String> deleteEmployee(@RequestParam("empno") Integer empno) {
		Employee employee = aa.getEmployeeByNo(empno);

		if (employee != null) {
			boolean deleted = aa.deleteEmployee(employee);
			if (deleted) {
				return ResponseEntity.ok("Employee deleted successfully");
			} else {
				return ResponseEntity.badRequest().body("Error deleting employee");
			}
		} else {
			return ResponseEntity.badRequest().body("Employee not found");
		}
	}

	@RequestMapping(value = "/addrecord", method = RequestMethod.POST)
	public String addrec(@RequestParam int empNo, @RequestParam int deptNo, @RequestParam String eName,
			@RequestParam String job, @RequestParam Double salary) {

		Employee ee = new Employee(empNo, deptNo, eName, job, salary);
		aa.updateEmployee(ee);
		aa.getAllEmployees();

		return "add";

	}

	// @RequestMapping(value = "/deleteEmployee", method = RequestMethod.POST)
	// public String deleteEmployee(@RequestParam("empno") int empno, Model model) {
	// Employee ee=new Employee();
	// ee.setEmpNo(empno);
	//
	// model.addAttribute(empno);
	//
	// aa.deleteEmployee(ee);
	// /*
	// if (employee != null) {
	//
	// if (deleted) {
	//
	// } else {
	//
	// }
	// } else {
	//
	// }*/
	// return "delete";
	// }

}
