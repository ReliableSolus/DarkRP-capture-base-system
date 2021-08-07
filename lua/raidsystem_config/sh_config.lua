-- Numbers for grouping professions into groups. Group numbers must be in ascending order from 1 to infinity
-- Do not delete group number 1.
RaidSystem.TeamsNames = {
    [1] = "Не захвачено",
    [2] = "Гражданские",
    [3] = "Полицейские"
}

-- Combining professions into groups. Group numbers should be taken from the table TeamsNames.
RaidSystem.RestrictedTeams = {
    [TEAM_CITIZEN] = 1,
    [TEAM_POLICE] = 2
}

-- The number of the police group. Used for a special code.
RaidSystem.PoliceTeamNumber = 2