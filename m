From: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/4] crypt.3: documented "rounds" parameter for SHA-* algorithms
Date: Sun,  3 Sep 2017 19:16:32 +0300
Message-ID: <1504455396-760-1-git-send-email-konstantin@shemyak.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

SHA-256 and SHA-512 based encryption algorithms support passing number of hashing rounds in the salt string, like:

crypt("password", "$5$rounds=100000$saltsaltsalt")

This was present since introduction of SHA-*-based algorithms in the glibc commit c3266dc0d85ed519ff40d1738aadf7b1280af3ba.

The parameter is explained. Minor wording and formatting fixes done.

Konstantin Shemyak (4):
  crypt.3: wfix: encryption is not done with SHA-xxx, but with a
    function based on SHA-xxx.
  crypt.3: ffix: added missing formatting
  crypt.3: wfix: clarified that ending of the salt string with '$' is
    optional
  crypt.3: Added description of previously undocumented 'rounds'
    parameter

 man3/crypt.3 | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
