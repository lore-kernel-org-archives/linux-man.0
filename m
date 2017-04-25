From: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Subject: [PATCH 0/2] A couple of minor typo fix's to stat{,x}.2
Date: Tue, 25 Apr 2017 13:18:13 +0100
Message-ID: <1493122695-8001-1-git-send-email-andrew@digital-domain.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi.

A couple of minor fix's.

- stat.2: tfix

Looks like in a recent edit a 'for' got turned into a 'f'.

- statx.2: tfix

Change a note about no glibc wrapper for 'renameat2' to 'statx'.

Cheers,
Andrew

Andrew Clayton (2):
  stat.2: tfix
  statx.2: tfix

 man2/stat.2  | 2 +-
 man2/statx.2 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
