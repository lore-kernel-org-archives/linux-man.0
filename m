From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] Minor changes to keyctl-related files
Date: Mon, 11 Sep 2017 05:11:04 +0200
Message-ID: <20170911031104.GA555@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

While working on documenting asymmetric key type (which, in turn,
turned into documenting all of the undocumented key types) some minor
fixes to keyctl/keyrings man pages have been accumulated, so I decided
to send them earlier (before 4.13 release, at least).

Eugene Syromyatnikov (4):
  keyctl.2: remove www.tmac inclusion
  keyctl.2: mention keyctl_dh_compute/keyctl_dh_compute_alloc
  keyrings.7: document description restriction for logon keys
  keyctl.2: remove parentheses from the crypto API URL description

 man2/keyctl.2   | 14 ++++++++++++--
 man7/keyrings.7 |  5 +++++
 2 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
