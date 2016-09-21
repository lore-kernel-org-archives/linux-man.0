From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] quotactl.2 updates
Date: Wed, 21 Sep 2016 06:28:10 +0300
Message-ID: <20160921032810.GA3699@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

The following set of patches provides set of updates for the quotactl.2
man page, mostly regarding XFS-specific subcommands.

eSyr (4):
  quotactl.2: Additions regarding project quotas
  quotactl.2: Updated information regarding disk quota flags
  quotactl.2: Updated information regarding XFS-specific quotactl
    subcommands
  quotactl.2: wfix

 man2/quotactl.2 |  260 ++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 229 insertions(+), 31 deletions(-)

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
