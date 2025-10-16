// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures

import 'dart:developer';

class NumberUtils {
  static num round2DP(
    num val,
  ) {
    String inString = val.toStringAsFixed(2);
    return num.parse(inString);
  }

  static num CalcSharesOfDollars(
      num DollarsAmount,
      num SharePrice,
      num proposalBalanceAd,
      bool HasDiscount,
      num TS1,
      num TD1,
      num TS2,
      num TD2,
      num TS3,
      num TD3,
      num TS4,
      num TD4) {
    try {
      if (HasDiscount) {
        num remainSizeInTranche = 0,
            DollarsForTranche1 = 0,
            DollarsForTranche2 = 0,
            DollarsForTranche3 = 0,
            DollarsForTranche4 = 0,
            DollarsAfterTranche4 = 0;

        if (proposalBalanceAd >= TS1) {
          //inside T2
          if (proposalBalanceAd >= (TS1 + TS2)) {
            //inside T3
            if (proposalBalanceAd >= (TS1 + TS2 + TS3)) {
              //inside T4
              if (proposalBalanceAd >= (TS1 + TS2 + TS3 + TS4)) {
                DollarsAfterTranche4 = DollarsAmount;
              } else {
                remainSizeInTranche =
                    TS4 - (proposalBalanceAd - TS1 - TS2 - TS3);
                if (DollarsAmount > remainSizeInTranche) {
                  DollarsForTranche4 = remainSizeInTranche;
                  DollarsAmount = DollarsAmount - DollarsForTranche4;
                  DollarsAfterTranche4 = DollarsAmount;
                } else
                  DollarsForTranche4 = DollarsAmount;
              }
            } else {
              //inside T3
              remainSizeInTranche = TS3 - (proposalBalanceAd - TS1 - TS2);
              if (DollarsAmount > remainSizeInTranche) {
                DollarsForTranche3 = remainSizeInTranche;
                DollarsAmount = DollarsAmount - DollarsForTranche3;
                if (DollarsAmount > TS4) {
                  DollarsForTranche4 = TS4;
                  DollarsAmount = DollarsAmount - DollarsForTranche4;
                  DollarsAfterTranche4 = DollarsAmount;
                } else
                  DollarsForTranche4 = DollarsAmount;
              } else
                DollarsForTranche3 = DollarsAmount;
            }
          } else {
            //inside T2
            remainSizeInTranche = TS2 - (proposalBalanceAd - TS1);
            if (DollarsAmount > remainSizeInTranche) {
              DollarsForTranche2 = remainSizeInTranche;
              DollarsAmount = DollarsAmount - DollarsForTranche2;
              if (DollarsAmount > TS3) {
                DollarsForTranche3 = TS3;
                DollarsAmount = DollarsAmount - DollarsForTranche3;
                if (DollarsAmount > TS4) {
                  DollarsForTranche4 = TS4;
                  DollarsAmount = DollarsAmount - DollarsForTranche4;
                  DollarsAfterTranche4 = DollarsAmount;
                } else
                  DollarsForTranche4 = DollarsAmount;
              } else
                DollarsForTranche3 = DollarsAmount;
            } else
              DollarsForTranche2 = DollarsAmount;
          }
        } else {
          //inside T1
          remainSizeInTranche = TS1 - proposalBalanceAd;
          if (DollarsAmount > remainSizeInTranche) {
            DollarsForTranche1 = remainSizeInTranche;
            DollarsAmount = DollarsAmount - DollarsForTranche1;
            if (DollarsAmount > TS2) {
              DollarsForTranche2 = TS2;
              DollarsAmount = DollarsAmount - DollarsForTranche2;
              if (DollarsAmount > TS3) {
                DollarsForTranche3 = TS3;
                DollarsAmount = DollarsAmount - DollarsForTranche3;
                if (DollarsAmount > TS4) {
                  DollarsForTranche4 = TS4;
                  DollarsAmount = DollarsAmount - DollarsForTranche4;
                  DollarsAfterTranche4 = DollarsAmount;
                } else
                  DollarsForTranche4 = DollarsAmount;
              } else
                DollarsForTranche3 = DollarsAmount;
            } else
              DollarsForTranche2 = DollarsAmount;
          } else
            DollarsForTranche1 = DollarsAmount;
        }

        num SharesForTranche1 = 0,
            SharesForTranche2 = 0,
            SharesForTranche3 = 0,
            SharesForTranche4 = 0,
            SharesAfterTranche4 = 0;

        if (DollarsForTranche1 > 0)
          SharesForTranche1 = round2DP((DollarsForTranche1 /
              round2DP((SharePrice - ((TD1 / 100) * SharePrice)))));
        if (DollarsForTranche2 > 0)
          SharesForTranche2 = round2DP((DollarsForTranche2 /
              round2DP((SharePrice - ((TD2 / 100) * SharePrice)))));
        if (DollarsForTranche3 > 0)
          SharesForTranche3 = round2DP((DollarsForTranche3 /
              round2DP((SharePrice - ((TD3 / 100) * SharePrice)))));
        if (DollarsForTranche4 > 0)
          SharesForTranche4 = round2DP((DollarsForTranche4 /
              round2DP((SharePrice - ((TD4 / (100)) * SharePrice)))));
        if (DollarsAfterTranche4 > 0)
          SharesAfterTranche4 = round2DP((DollarsAfterTranche4 / SharePrice));

        return round2DP(SharesForTranche1 +
            SharesForTranche2 +
            SharesForTranche3 +
            SharesForTranche4 +
            SharesAfterTranche4);
      } else
        return round2DP(DollarsAmount / SharePrice);
    } catch (ex) {
      log(ex.toString());
    }
    return 1;
  }
}
