From: Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 0/6] Add strfromd.3: changelog
Date: Wed,  7 Dec 2016 10:54:48 -0200
Message-ID: <cover.1481114754.git.wainersm@linux.vnet.ibm.com>
References: <bf67bf0f-0ac8-9d88-3a07-3f705e1f743e@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bf67bf0f-0ac8-9d88-3a07-3f705e1f743e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This patch set has following changes since v2:
 - In EXAMPLES, replaced use of malloc with char[ssize]
 - In NOTES, s/depends on/take account of

Wainer dos Santos Moschetta (6):
  Add strfromd.3
  strfromf.3: add link to strfromd(3)
  strfroml.3: add link to strfromd(3)
  atof.3: SEE ALSO: add strfromd(3)
  printf.3: SEE ALSO: add strfromd(3)
  strtod.3: SEE ALSO: add strfromd(3)

 man3/atof.3     |   1 +
 man3/printf.3   |   1 +
 man3/strfromd.3 | 255 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 man3/strfromf.3 |   1 +
 man3/strfroml.3 |   1 +
 man3/strtod.3   |   1 +
 6 files changed, 260 insertions(+)
 create mode 100644 man3/strfromd.3
 create mode 100644 man3/strfromf.3
 create mode 100644 man3/strfroml.3

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
