﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////


// контекст фреймворка Vanessa-Behavior
Перем Ванесса;

// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПрерываюВыполнениеШаговИПодключаюТаймер(Парам01)","ЯПрерываюВыполнениеШаговИПодключаюТаймер","Когда я прерываю выполнение шагов и подключаю таймер ""СлужебныйТаймер""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВторойШагНеДолженВыполниться()","ВторойШагНеДолженВыполниться","Тогда второй шаг не должен выполниться");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ПолучитьМакет(ИмяМакета);
КонецФункции
	

// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////


// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры


// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	Ванесса.ПолучитьФорму("Форма").ХостСистема.ПродолжитьВыполнениеШагов();
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////


Процедура СлужебныйТаймер()
	Ванесса.ПродолжитьВыполнениеШагов(Истина);
КонецПроцедуры


//Когда я прерываю выполнение шагов и подключаю таймер "СлужебныйТаймер"
//@ЯПрерываюВыполнениеШаговИПодключаюТаймер(Парам01)
Процедура ЯПрерываюВыполнениеШаговИПодключаюТаймер(ИмяОбработчика) Экспорт
	Ванесса.ЗапретитьВыполнениеШагов();

	ОбычнаяФорма = ПолучитьФорму("ОбычнаяФорма");
	ОбычнаяФорма.ПодключитьТаймер(Ванесса);
	ОбычнаяФорма.Открыть();
	
КонецПроцедуры


//Тогда второй шаг не должен выполниться
//@ВторойШагНеДолженВыполниться()
Процедура ВторойШагНеДолженВыполниться() Экспорт
	ВызватьИсключение "Не реализовано.";
КонецПроцедуры

//окончание текста модуля  