From: Robert Bihlmeyer <r.bihlmeyer-LBFTf0UgD8fk7+2FdBfRIA@public.gmane.org>
Subject: Small nit in locale(7)
Date: Wed, 26 Mar 2014 14:15:11 +0100
Message-ID: <87lhvxdrts.fsf@baal.isag.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

citing from locale(7):

   LC_ADDRESS
              [...] which return strings such as
              "Deutschland" and "Deutsch" (for German-language locales).

The first is not true for most German-language locales, only for de_DE*

br,
-- 
Robert Bihlmeyer    ASSIST    Arrow ECS Internet Security AG
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
