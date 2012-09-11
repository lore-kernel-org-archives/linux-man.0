From: Scott Pakin <pakin-YOWKrPYUwWM@public.gmane.org>
Subject: Missing caveat for tsearch(3) man page
Date: Tue, 11 Sep 2012 11:47:23 -0600
Message-ID: <504F792B.7080603@lanl.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael,

I just spent a number of hours tracking down a bug in my code that
could have been averted had the tsearch(3) man page included one tiny,
little warning.  As far as I can tell, the pointer returned by
tsearch() and tfind() -- itself typically a pointer to the user's data
-- is not safe to use after subsequent tree operations.  (Longer
story: tsearch.c is really returning a pointer to a field of an
internal data structure -- type "node" -- but due to red/black tree
restructuring, the same node can point to different user data at
different points in the execution.)  Hence, the following code
nondeterministically leads to double free()s:

    for (i=0; i<N; i++)
      match[i] = tfind(...);
    for (i=0; i<N; i++)
      tdelete(*match[i], ...);

May I suggest the following wording for the tsearch(3) man page?

    CAVEATS
        The item pointers returned by tsearch() and tfind() are not
        guaranteed to be valid after subsequent invocations of
        tsearch(), tfind(), tdelete(), or twalk() (or, of course,
        tdestroy()).

Regards,
-- Scott
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
