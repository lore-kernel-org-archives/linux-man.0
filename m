From: Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/6] Add strfromd.3: changelog
Date: Mon,  5 Dec 2016 16:30:32 -0200
Message-ID: <cover.1480961953.git.wainersm@linux.vnet.ibm.com>
References: <c5d0be31-9c1d-000a-89ac-a18909ef4ac5@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c5d0be31-9c1d-000a-89ac-a18909ef4ac5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This patch set have following changes since v1:
- Broke in fine-grained patches.
- Moved content from strfrom.3 to strfromd.3.
- strfromf.3 and strfroml.3 link to strfromd.3.
- Changed strfromd.3:
  - Keep source lines less than the 75 characters length limit.
  - Wrapped function declarations in 75 chars limit.
  - Now start new sentences on new source lines.
  - Fixed typos.
  - Added NOTES section about locale influence in strfrom* functions.
  - Added atof.3 and strtod.3 to SEE ALSO.
  - Formatted examples.
- Added strfromd(3) to SEE ALSO of atof(3), printf(3), and strtod(3).

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
