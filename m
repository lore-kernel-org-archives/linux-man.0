From: Ezio Melotti <ezio.melotti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Typo in tzfile man page
Date: Tue, 30 Apr 2013 11:03:03 +0300
Message-ID: <CACBhJdEY5E28iTmSdbuofZV98d4TOw1iX68X7J0JsvrM4w7rrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The second line of the "Description" of the tzfile man page contains a typo:
"The time zone information files used by tzset(3) begin with the magic
characters "TZif" to identify then as time zone information files"

s/then/them/

$ man -w 5 tzfile
/usr/share/man/man5/tzfile.5.gz
$ dpkg -p manpages-dev | grep Version
Version: 3.40-0.1ubuntu3
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 12.10
Release:        12.10
Codename:       quantal

Best Regards,
Ezio Melotti
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
