# Čtenáři k výmazu

Vytvoří .tsv soubor z textu mailů se čtenáři k výmazu.

Maily mají tento formát:


P.č.   ID čtenáre    Jméno                         Typ              Status                 Narozen      Registrován  Expirován
-----  ------------  ----------------------------  ---------------  ---------------------  -----------  -----------  -----------
   1.  12142111      Příjmení, jméno               Neurčen          student fakulty        11.01.1984   21.08.2005   10.04.2019

## Postup

- všechny maily zkopírovat do jednoho souboru
- spustit:

   lua vymaz.lua < ctenari.txt > vysledek.tsv
