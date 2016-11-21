From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/5] Re: Revised request_key(2) man page for review
Date: Mon, 21 Nov 2016 23:59:33 +0300
Message-ID: <20161121205933.GA15629@obsidian>
References: <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <528b203d-ac72-e4a6-8517-e8c5c11055a4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

Possible amendments are in the following patches. The one thing i
couldn't comprehend properly is the following paragraph:

[[
This entry specifies that when a new "user" key with the prefix
"mtk:" must be instantiated, that task should be performed via the
.BR keyctl (1)
command's
.B instantiate
operation.
(The program could 
The arguments supplied to the
.B instantiate
operation are:
the ID of the uninstantiated key
.RI ( %k );
the callout data supplied to the
.BR request_key ()
call
.RI ( %c );
and the session keyring
.RI ( %S )
of the requestor (i.e., the caller of
.BR request)key ()).
i(See
.BR request-key.conf (5)
for details of these
.I %
specifiers.)
]]

I suppose there's some sort of copy-paste mistake.

Eugene Syromyatnikov (5):
  request_key.2: add information regarding default keyring
  requesT_key.2: add information regarding minimal kernel version for
    key instantiation on request
  request_key.2: whitespace fix
  request_key.2: wfix
  request_key.2: additional error information

 man2/request_key.2 | 64 +++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 8 deletions(-)

-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
