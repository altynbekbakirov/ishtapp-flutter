import 'dart:convert';

import 'package:ishtapp/datas/actions.dart';
import 'package:ishtapp/datas/user.dart';
import 'package:redux_api_middleware/redux_api_middleware.dart';
import 'package:ishtapp/datas/vacancy.dart';

import 'RSAA.dart';

VacancyState vacancyReducer(VacancyState state, FSA action) {
  VacancyState newState = state;

  switch (action.type) {
    case LIST_VACANCIES_REQUEST:
      newState.list.error = null;
      newState.list.loading = true;
      newState.list.data = null;
      return newState;

    case LIST_VACANCIES_SUCCESS:
      newState.list.error = null;
      newState.list.loading = false;
      newState.list.data = vacanciesFromJsonStr(action.payload);
      return newState;

    case LIST_VACANCIES_FAILURE:
      newState.list.error = action.payload;
      newState.list.loading = false;
      newState.list.data = null;
      return newState;

    case GET_LIKED_VACANCY_REQUEST:
      newState.liked_list.error = null;
      newState.liked_list.loading = true;
      newState.liked_list.data = null;
      return newState;

    case GET_LIKED_VACANCY_SUCCESS:
      newState.liked_list.error = null;
      newState.liked_list.loading = false;
      newState.liked_list.data = vacanciesFromJsonStr(action.payload);
      return newState;

    case GET_LIKED_VACANCY_FAILURE:
      newState.liked_list.error = action.payload;
      newState.liked_list.loading = false;
      newState.liked_list.data = null;
      return newState;

    case GET_SUBMITTED_VACANCY_REQUEST:
      newState.submitted_list.error = null;
      newState.submitted_list.loading = true;
      newState.submitted_list.data = null;
      return newState;

    case GET_SUBMITTED_VACANCY_SUCCESS:
      newState.submitted_list.error = null;
      newState.submitted_list.loading = false;
      newState.submitted_list.data = vacanciesFromJsonStr(action.payload);
      return newState;

    case GET_SUBMITTED_VACANCY_FAILURE:
      newState.submitted_list.error = action.payload;
      newState.submitted_list.loading = false;
      newState.submitted_list.data = null;
      return newState;

    case GET_COMPANY_VACANCIES_REQUEST:
      newState.list.error = null;
      newState.list.loading = true;
      newState.list.data = null;
      return newState;

    case GET_COMPANY_VACANCIES_SUCCESS:
      newState.list.error = null;
      newState.list.loading = false;
      newState.list.data = vacanciesFromJsonStr(action.payload);
      return newState;

    case GET_COMPANY_VACANCIES_FAILURE:
      newState.list.error = action.payload;
      newState.list.loading = false;
      newState.list.data = null;
      return newState;

    case GET_COMPANY_INACTIVE_VACANCIES_REQUEST:
      newState.inactive_list.error = null;
      newState.inactive_list.loading = true;
      newState.inactive_list.data = null;
      return newState;

    case GET_COMPANY_INACTIVE_VACANCIES_SUCCESS:
      newState.inactive_list.error = null;
      newState.inactive_list.loading = false;
      newState.inactive_list.data = vacanciesFromJsonStr(action.payload);
      return newState;

    case GET_COMPANY_INACTIVE_VACANCIES_FAILURE:
      newState.inactive_list.error = action.payload;
      newState.inactive_list.loading = false;
      newState.inactive_list.data = null;
      return newState;

    case GET_LIKED_VACANCY_NUMBER_REQUEST:
      newState.number_of_likeds = 0;
      return newState;

    case GET_LIKED_VACANCY_NUMBER_SUCCESS:
      if (action.payload == "FALSE")
        newState.number_of_likeds = null;
      else if (int.parse(action.payload) == 0)
        newState.number_of_likeds = null;
      else
        newState.number_of_likeds = int.parse(action.payload);
      return newState;

    case GET_LIKED_VACANCY_NUMBER_FAILURE:
      newState.number_of_likeds = null;
      return newState;

    case GET_SUBMITTED_VACANCY_NUMBER_REQUEST:
      newState.number_of_submiteds = 0;
      return newState;

    case GET_SUBMITTED_VACANCY_NUMBER_SUCCESS:
      newState.number_of_submiteds = int.parse(action.payload);
      return newState;

    case GET_SUBMITTED_VACANCY_NUMBER_FAILURE:
      newState.number_of_submiteds = 0;
      return newState;

    case GET_ACTIVE_VACANCY_NUMBER_REQUEST:
      newState.number_of_active_vacancies = 0;
      return newState;

    case GET_ACTIVE_VACANCY_NUMBER_SUCCESS:
      if (int.parse(action.payload) == 0)
        newState.number_of_active_vacancies = null;
      else
        newState.number_of_active_vacancies = int.parse(action.payload);
      return newState;

    case GET_ACTIVE_VACANCY_NUMBER_FAILURE:
      newState.number_of_active_vacancies = null;
      return newState;

    case GET_INACTIVE_VACANCY_NUMBER_REQUEST:
      newState.number_of_inactive_vacancies = 0;
      return newState;

    case GET_INACTIVE_VACANCY_NUMBER_SUCCESS:
      if (int.parse(action.payload) == 0)
        newState.number_of_inactive_vacancies = null;
      else
        newState.number_of_inactive_vacancies = int.parse(action.payload);
      return newState;

    case GET_INACTIVE_VACANCY_NUMBER_FAILURE:
      newState.number_of_inactive_vacancies = null;
      return newState;

    case DELETE_ITEM:
      newState.list.error = null;
      newState.list.loading = true;
      newState.list.data = null;
      return newState;

    default:
      return newState;
  }
}

List<Vacancy> vacanciesFromJsonStr(dynamic payload) {
  Iterable jsonArray = json.decode(payload);
  return jsonArray.map((j) => Vacancy.fromJson(j)).toList();
}
