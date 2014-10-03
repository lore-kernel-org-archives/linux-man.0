From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 0/3] getrandom.2: new manpage
Date: Fri,  3 Oct 2014 02:13:17 +0200
Message-ID: <1412295197-8100-1-git-send-email-xypron.glpk@gmx.de>
References: <542A7645.8070802@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542A7645.8070802-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,

I corrected my patch as requested plus some other typos.

Best regards

Heinrich

On 30.09.2014 11:22, Michael Kerrisk (man-pages) wrote

::: +getrandom \- fill buffer with random bytes
: 
: Maybe better:
: s/fill buffer with/obtain a series of/
done

:: +Therefore it should not be used for Monte Carlo simulations or other
: 
: s/it/.BR getrandom ()/
done

:: +.I /dev/random
:: +pool is limited based on the entropy that can be obtained from environmental
:: +noise, so if there is insufficient entropy, the requested number of bytes may
:: +not be returned.
: 
: And at this point I ask myself: so, what is returned? Is it a short "read".
: If so, then say something like: "the call may return fewer bytes than
: requested". And what happens if no entropy is available?
rewritten

:: +This may not be all the bytes requested by the caller via
: 
: s/This may not be all the/This may be less than the number of/
done

:: +.SS Interrupt handling
: 
: s/Interrupt handling/Interruption by a signal handler/
done

:: +Instead it will return all of the bytes that have been requested.
: 
: s/Instead/Instead,/
done

:: +for small values of
: 
: s/small/small (<= 256)
done

:: +The described behavior was designed for compatibility with
: 
: It's not quite clear what "The described behavior" refers to.
: Can you improve this?
rewritten

:: +always check the return value, in case it returns some error,
: 
: s/returns/indicates/
done

: 
:: +or if fewer bytes than requested were returned.
:: +In the case of
:: +.RB ! GRND_RANDOM
:: +and small request,
: 
: Change the preceding to
: 
: In the case where
: .B GRND_RANDOM
: is not specified and
: .I bufken
: is less than or equal to 256,
done

: 
:: the latter should never happen, but the careful user-space
: 
: s/the latter should never happen/
:    a return of fewer bytes than requested should never happen/
done

:: +.IR getrandom ()
: 
: s/IR/BR/
done
: 
: Could you make you next submission a two-patch series, with the
: second patch adding SEE ALSO entries in random(3) and random(4).
see next mails


Heinrich Schuchardt (3):
  getrandom.2: new manpage
  random.3: SEE ALSO getrandom.2
  random.4: SEE ALSO getrandom.2

 man2/getrandom.2 | 242 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 man3/random.3    |   1 +
 man4/random.4    |   1 +
 3 files changed, 244 insertions(+)
 create mode 100644 man2/getrandom.2

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
