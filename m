From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] mem.4 updates
Date: Fri,  2 Jan 2015 14:11:35 +0100
Message-ID: <1420204298-25625-1-git-send-email-eliedebrauwer@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,

Attached are three patches which modify mem.4:
 - One explains that /dev/kmem is only accessisble if CONFIG_DEVKMEM is set
 - Another one which fixes an error in the group name used in the example
   to create /dev/port.
 - A last one which explains the impact of the CONFIG_STRICT_DEVMEM option
   on /dev/mem.

my 2 cents
E.


Elie De Brauwer (3):
  mem.4: /dev/kmem depends on CONFIG_DEVKMEM
  mem.4: correct /dev/port group in example
  mem.4: Add CONFIG_STRICT_DEVMEM

 man4/mem.4 | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
