From: bill o gallmeister <bog.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: pthread_self.3: arith type or structure
Date: Fri, 06 Nov 2009 13:50:06 -0800
Message-ID: <4AF49A0E.6080004@gmail.com>
References: <alpine.LSU.2.00.0911060158001.12689@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LSU.2.00.0911060158001.12689-SHaQjdQMGhDmsUXKMKRlFA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Jan Engelhardt wrote:

> in man-pages 3.23, one can read in pthread_self.3:
> 
> 
> "POSIX.1 allows an implementation wide freedom in choosing the type
> used to represent a thread ID; for example, representation using
> either an arithmetic type or a structure is permitted."
> 
> http://opengroup.org/onlinepubs/007908799/xsh/systypes.h.html
> however mentions "all of the types are defined as arithmetic types".
> Would you know which of the two documentations (linux-man-pages,
> opengroup's website) is correct?

It depends on which spec the implementation conforms to.  An Opengroup conformant
system would need to provide an arithmetic type, whereas an IEEE 1003.1c-1995
conformant system could get away with a more relaxed specification of pthread_t.

I can speak to the POSIX spec for pthread_t.  The idea was to allow it to be
implemented as any sort of type;  hence the provision of pthread_equal() to
compare two pthread_t variables.

The opengroup spec would seem to have specified this further (the pthreads spec
is from 1995 and the Opengroup spec says 1997).  I am not sure why that would be.
If you're an application programmer,  I would advise you to assume that pthread_t
is not an arithmetic type.  On the other hand, I have yet to see an implementation
where it is not some sort of integer or pointer.

- bog

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
