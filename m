From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 0/4] Trivialities
Date: Wed,  4 Jun 2014 18:33:24 +0200
Message-ID: <1401899608-30515-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Rasmus Villemoes (4):
  getdate.3: Use blank definition of _GNU_SOURCE
  open_by_handle_at.2: Add reference to feature_test_macros(7)
  recvmmsg.2: Add reference to feature_test_macros(7)
  sendmmsg.2: Add reference to feature_test_macros(7)

 man2/open_by_handle_at.2 | 2 +-
 man2/recvmmsg.2          | 2 +-
 man2/sendmmsg.2          | 2 +-
 man3/getdate.3           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
