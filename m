From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 178241] New: tcp.7 says SIOCOUTQ counts unsent bytes, but in
 actually counts unacknowledged bytes
Date: Tue, 18 Oct 2016 08:13:07 +0000
Message-ID: <bug-178241-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=178241

            Bug ID: 178241
           Summary: tcp.7 says SIOCOUTQ counts unsent bytes, but in
                    actually counts unacknowledged bytes
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: njs-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org
        Regression: No

tcp.7 says:

       SIOCOUTQ
              Returns the amount of unsent data in the socket send queue. [...]

I believe that this is incorrect, and that it actually returns the amount of
*unacknowledged* data in the socket send queue (i.e., unsent data + data that
has been sent, but for which we're still waiting for an ACK).

This can be confirmed by looking at the source, which does:

575                         answ = tp->write_seq - tp->snd_una;

http://lxr.free-electrons.com/source/net/ipv4/tcp.c#L568

here tp->snd_una is the boundary between acknowledged and unacknowledged data.
If it were reporting unsent data, it would need to use tp->snd_nxt instead.
(The diagram in RFC 793 may help visualize this:
https://tools.ietf.org/html/rfc793#page-20)

I discovered this while trying to figure out how TCP_NOTSENT_LOWAT works.
TCP_NOTSENT_LOWAT makes it so that a socket only becomes writeable if the
unsent data is under a certain threshold, yet SIOCOUTQ was reporting that I had
more unsent data than that, and yet the socket was still writeable... which
makes sense if SIOCOUTQ is not actually reporting the amount of unsent data
:-).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
