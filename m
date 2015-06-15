From: "Lev Lafayette" <lev-W+9der7VlStk53QK6YMAwg@public.gmane.org>
Subject: [patch] wfix : free
Date: Mon, 15 Jun 2015 11:54:45 +1100
Message-ID: <96bc0b444c3edd0b16bbc5d842364985.squirrel@webmail.levlafayette.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;boundary="----=_20150615115445_52511"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

------=_20150615115445_52511
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Hi man-page people,

The command "free" allows for measurement in gigabytes (free -g), but this
not noted in the man page. It *is* available in free --help

Please find attached a suggested patch.

All the best,


-- 
Lev Lafayette, BA (Hons), GradCertTerAdEd (Murdoch), GradCertPM, MBA (Tech
Mngmnt) (Chifley)
mobile:  0432 255 208
RFC 1855 Netiquette Guidelines
http://www.ietf.org/rfc/rfc1855.txt
------=_20150615115445_52511
Content-Type: text/x-patch; name="free.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="free.patch"

--- free1.txt	2015-06-15 10:41:09.445473401 +1000
+++ free2.txt	2015-06-15 10:49:17.878241309 +1000
@@ -6,7 +6,7 @@
        free - Display amount of free and used memory in the system
 
 SSYYNNOOPPSSIISS
-       ffrreeee [--bb | --kk | --mm] [--oo] [--ss _d_e_l_a_y ] [--tt] [--VV]
+       ffrreeee [--bb | --kk | --mm | --gg] [--oo] [--ss _d_e_l_a_y ] [--tt] [--VV]
 
 DDEESSCCRRIIPPTTIIOONN
        ffrreeee  displays the total amount of free and used physical and swap mem‐
@@ -16,7 +16,7 @@
    OOppttiioonnss
        The  --bb  switch  displays  the amount of memory in bytes; the --kk switch
        (set by default) displays it in kilobytes; the --mm switch displays it in
-       megabytes.
+       megabytes; the --gg switch displays it in gigabytes.
 
        The --tt switch displays a line containing the totals.
 
------=_20150615115445_52511--


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
