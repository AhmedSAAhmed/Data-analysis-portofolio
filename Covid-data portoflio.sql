select *
from portfolioProject..CovidDeaths
where continent is not null
order by 3,4

--select *
--from portfolioProject..CovidVaccination
--order by 3,4


--select data that iam going to use 

select location,date,total_cases,new_cases,total_deaths,population
from portfolioProject..CovidDeaths
order by 1,2

--total cases vs total deaths

select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
from portfolioProject..CovidDeaths
order by 1,2

  --total cases vs popualtion
select location,date,population,total_cases ,(total_deaths/population)*100 as Percentageofpopualtion
from portfolioProject..CovidDeaths
order by 1,2

--high country infection rate compared to population
select location,population, MAX(total_cases) as highinfectioncount,max((total_cases/population))*100 as percentagepopualtioninfected
from portfolioProject..CovidDeaths
group by location,population
order by percentagepopualtioninfected desc

--countries with highest death count per population
select location,max(cast(total_deaths as int)) as totaldeathcount
from portfolioProject..CovidDeaths
group by location
order by totaldeathcount desc

--show the contintents with highest death rate
select continent ,MAX(cast(total_deaths as int)) as totaldeathcount
from portfolioProject..CovidDeaths
where continent is not null
group by continent
order by totaldeathcount desc

-- join the deaths and the vaccination table 
 select *
 from portfolioProject..CovidDeaths dea
 join portfolioProject..CovidVaccination vac
  on dea.location = vac.location
  and dea.date = vac.date

   

