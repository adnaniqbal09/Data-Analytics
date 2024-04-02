Select *
from PortfolioProject.dbo.CovidDeaths
Where continent is not null
ORDER BY 3, 4

--Select *
--from PortfolioProject.dbo.CovidVaccinations
--ORDER BY 3, 4

-- Selecting Data that we are using
SELECT Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject.dbo.CovidDeaths
ORDER BY 1, 2

-- Looking at Total cases vs Total deaths
-- Looking at precentage deaths compared to cases
SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject.dbo.CovidDeaths
Where location like 'India'
ORDER BY 1, 2

-- Looking at total cases vs the population
-- Percentage of population that is affected
SELECT Location, date, population, total_cases, (total_cases/population)*100 as CasesPercentage
From PortfolioProject.dbo.CovidDeaths
-- Where location like 'India'
ORDER BY 1, 2

 --  Checking countries with highest infection rate comapred to population

SELECT Location, population, MAX(total_cases) as HighestInfectionCount,MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject.dbo.CovidDeaths
-- Where location like 'India'
Group by population, location
ORDER BY PercentPopulationInfected desc

-- Countries with the highest death count per population
SELECT Location, MAX(cast(total_deaths as bigint)) as TotalDeathCount
From PortfolioProject.dbo.CovidDeaths
-- Where location like 'India'
Where continent is not null
Group by location
ORDER BY TotalDeathCount desc


