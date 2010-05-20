From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: Unexpected splice "always copy" behavior observed
Date: Thu, 20 May 2010 07:18:21 -0700 (PDT)
Message-ID: <alpine.LFD.2.00.1005200715460.23538@i5.linux-foundation.org>
References: <1274280968.26328.774.camel@gandalf.stny.rr.com> <alpine.LFD.2.00.1005190758070.23538@i5.linux-foundation.org> <E1OElGh-0005wc-I8@pomaz-ex.szeredi.hu> <1274283942.26328.783.camel@gandalf.stny.rr.com> <20100519155732.GB2039@Krystal>
 <20100519162729.GE2516@laptop> <20100519191439.GA2845@Krystal> <alpine.LFD.2.00.1005191220370.23538@i5.linux-foundation.org> <20100519214905.GA22486@Krystal> <alpine.LFD.2.00.1005191659100.23538@i5.linux-foundation.org> <20100520015605.GA28411@Krystal>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100520015605.GA28411@Krystal>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Desnoyers <mathieu.desnoyers-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
Cc: Nick Piggin <npiggin-l3A5Bk7waGM@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tardyp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mingo-X9Un+BFzKDI@public.gmane.org, acme-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tzanussi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, ziga.mahkovec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org, cl-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



On Wed, 19 May 2010, Mathieu Desnoyers wrote:
> 
>        Programs  can  use  posix_fadvise()  to announce an intention to access
>        file data in a specific pattern in the future, thus allowing the kernel
>        to perform appropriate optimizations.

It's true for some of them. The random-vs-linear behavior is a flag for 
the future, for example (relevant for prefetching).

In fact, it's technically true even for DONTNEED. It's true that we won't 
need the pages in the future! So we throw the pages away. But that means 
that we throw the _current_ pages away.

If we actually touch pages later, than that obviously invalidates the fact 
that we said 'DONTNEED' - we clearly needed them.

		Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
