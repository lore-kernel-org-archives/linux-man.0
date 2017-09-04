From: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 0/3] crypt.3: documented "rounds" parameter for SHA-* algorithms
Date: Mon,  4 Sep 2017 21:53:50 +0300
Message-ID: <1504551233-26383-1-git-send-email-konstantin@shemyak.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

SHA-256 and SHA-512 based encryption algorithms support passing number of
hashing rounds in the salt string, like:

crypt("password", "$5$rounds=100000$saltsaltsalt")

This was present since introduction of SHA-*-based algorithms in the
glibc commit c3266dc0d85ed519ff40d1738aadf7b1280af3ba.

The parameter is explained. Additional minor corrections done.
Patch 2/4 from the series reported as "applied" in the first version is
not re-sent.

Konstantin Shemyak (3):
  crypt.3: encryption is not done with SHA-xxx, but with a function
    based on SHA-xxx
  crypt.3: clarified that ending of the salt string with '$' is optional
  crypt.3: added description of previously undocumented 'rounds'
    parameter

 man3/crypt.3 | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
