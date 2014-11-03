From: Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Mon, 03 Nov 2014 13:07:35 +0000
Message-ID: <54577E17.7000109@jkqxz.net>
References: <544118FA.3070003@gmail.com>	<CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>	<54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>	<1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>	<1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>	<544EAF20.8050509@jkqxz.net> <ork33jqmqe.fsf@free.home>	<1414573935.18538.74.camel@triegel.csb> <orfve5tp3e.fsf@free.home>	<1414694486.10085.165.camel@triegel.csb> <oregtn8h23.fsf@free.home>	<1414845631.10085.474.camel@triegel.csb> <or1tpm3hn5.fsf@free.home>	<1414871691.10085.529.camel@triegel.csb> <orzjc8zvn6.fsf@free.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <orzjc8zvn6.fsf-pcXFJVXz+5uzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/11/14 05:43, Alexandre Oliva wrote:
>
> The key is external observability, and ordering requirements.
>
> strcpy's sequential specification does not mandate chars to be copied in
> any predetermined order, so strcpy is free to reorder and regroup loads
> and stores as it sees fit.  None of this steps out of its explicit
> specification.  Writing garbage, however, would step out, but it might
> still be allowed under the as-if rule if this couldn't be legitimately
> observed, e.g. if any attempt to observe it would invoke undefined
> behavior.

On 03/11/14 05:13, Alexandre Oliva wrote:
 >
 > The way is not specified, but it does not state that it is to write
 > something else there before, and doing so is NOT allowed by the as-if
 > rule.  Consider a function that goes:
 >
 >    for (;;) {
 >      extern char buffer[];
 >      strcpy (buffer, "foo");
 >      signal (SIGUSR1, testme);
 >      strcpy (buffer, "fool");
 >      signal (SIGUSR1, SIG_IGN);
 >    }
 >
 >
 > Now, if the signal handler testme were to inspect buffer[1] (knowing the
 > only window in which it may be activated is the above, in a
 > single-threaded program), what values could it possibly find there?
 > Please justify with quotes from combinations of C and POSIX standards of
 > the same vintage you can find.  How about buffer[0], and buffer[3]?
 >

I disagree with this reasoning, though I am not sufficiently familiar 
with the standards involved to argue with it effectively.

However, I do see a more concerning point here: does this argument also 
apply to memcpy()?  I can't find any language in the standard which 
places additional requirements on strcpy() (and which would disallow 
implementation as strlen+memcpy, for example).

Given that, does it not follow that the current, released, 
implementation of memcpy() in glibc for architectures using a wh64 
instruction (alpha, tilepro and tilegx) is entirely wrong?

- Mark

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
