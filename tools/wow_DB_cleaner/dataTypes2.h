// logon account struct
struct Account
{
    unsigned int id;
    char* username;
    char* sha_pass_hash;
    char* sessionkey;
    char* v;
    char* s;
    char* email;
    char* joindate; // Format timestamp
    char* last_ip;
    unsigned int failed_logins;
    unsigned short int locked;
    char* last_login; // Format timestamp
    unsigned short int online;
    unsigned short int expansion;
    unsigned long int mutetime;
    unsigned short int locale;
    char* os;
    unsigned int recruiter;
};

// logon account_banned struct
struct Account_banned
{
    unsigned int id;
    unsigned int bandate;
    unsigned int unbandate;
    char* bannedby;
    char* banreason;
    unsigned short int active;
};

// TODO: La tabla realmcharacters debe eliminarse por completo y crearse sobre la marcha no necesita struct.

//character characters struct
struct characters
{
    unsigned int guid;
    unsigned int account;
    char* name;
    unsigned short int race;
    unsigned short int cclass;
    unsigned short int gender;
    unsigned short int level;
    unsigned int xp;
    unsigned int playerBytes;
    unsigned int playerBytes2;
    unsigned int playerFlags;
    float position_x;
    float position_y;
    float position_z;
    unsigned short int map;
    unsigned int instance_id;
    unsigned short int instance_mode_mask;
    float orientation;
    char* taximask;
    unsigned short int online;
    unsigned short int cinematic;
    unsigned int totaltime;
    unsigned int leveltime;
    unsigned int logout_time;
    unsigned short int is_logout_resting;
    float rest_bonus;
    unsigned int resettalents_cost;
    unsigned int resettalents_time;
    float trans_x;
    float trans_y;
    float trans_z;
    float trans_o;
    unsigned int transguid;
    unsigned short int extra_flags;
    unsigned short int stable_slots;
    unsigned short int at_login;
    unsigned short int zone;
    unsigned int death_expire_time;
    char* taxi_path;
    unsigned int arenaPoints;
    unsigned int totalHonorPoints;
    unsigned int todayHonorPoints;
    unsigned int yesterdayHonorPoints;
    unsigned int totalKills;
    unsigned short int todayKills;
    unsigned short int yesterdayKills;
    unsigned int chosenTitle;
    unsigned long int knownCurrencies;
    unsigned int watchedFaction;
    unsigned short int drunk;
    unsigned int health;
    unsigned int power1;
    unsigned int power2;
    unsigned int power3;
    unsigned int power4;
    unsigned int power5;
    unsigned int power6;
    unsigned int power7;
    unsigned int latency;
    unsigned short int speccount;
    unsigned short int activespec;
    char* exploredZones;
    char* equipmentCache;
    unsigned int ammoId;
    char* knownTitles;
    unsigned short int actionBars;
    unsigned short int grantableLevels;
    unsigned int deleteInfos_Account;
    char* deleteInfos_Namevar;
    unsigned int deleteDate;
};



















