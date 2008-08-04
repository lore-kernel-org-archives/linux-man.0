From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFH] Math function error-reporting tests
Date: Mon, 4 Aug 2008 20:41:36 +0200
Message-ID: <cfd18e0f0808041141h65800f0dwe8b3428bf2dcbca4@mail.gmail.com>
References: <cfd18e0f0808040848k4b93edafvbfc5b59d19093ee6@mail.gmail.com>
	 <5EFD4D7AC6265F4D9D3A849CEA9219190E31E0@LAXA.intra.cea.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5EFD4D7AC6265F4D9D3A849CEA9219190E31E0-W3oABskqM8nDbSVrWjnAJFAUjnlXr6A1@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: GHORBAL Khalil 218205 <khalil.ghorbal-KCE40YydGKI@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-help-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Aug 4, 2008 at 7:25 PM, GHORBAL Khalil 218205
<khalil.ghorbal-KCE40YydGKI@public.gmane.org> wrote:
>
> attached, mt.log files for 2.3.2, 2.3.6 and 2.7 versions.

Thanks Khalil.  So now I have

2.2.4
2.3.2
2.3.3
2.3.5
2.3.6
2.7
2.8

Cheers,

Michael

> -----Original Message-----
> From: libc-help-owner-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org on behalf of Michael Kerrisk
> Sent: Mon 8/4/2008 5:48 PM
> To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; libc-help-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
> Cc: Andreas Jaeger; Joseph S. Myers; Andries Brouwer; Fabian Kreutz
> Subject: [RFH] Math function error-reporting tests
>
> Hello linux-man and libc-help,
>
> I'm in the process of revising all of the man-pages describing the
> math functions in glibc.  I recently wrote some scripts to test the
> error-reporting support (i.e., errno versus exceptions) in all of the
> glibc math functions (for some background, look here:
> http://thread.gmane.org/gmane.comp.lib.glibc.alpha/13583/).  Andries
> helped me iron out a few bugs, and get a few more test results, so
> that I now have data for the following glibc versions:
>
> 2.2.4
> 2.3.3
> 2.3.5
> 2.7
> 2.8
>
> I'd like to get test results for as many (x86) glibc versions as
> possible, especially (but not only) for glibc versions before 2.2.4.
> Would any folk on the list who have x86 systems with other glibc
> versions be prepared to run my test scripts and send me the results?
>
> A run of the scripts takes of the order of one minute.
>
> (To find out what glibc version you are running, enter the following command
>
>    /lib/libc.so.6
>
> and look at the first line of output.)
>
> To run the script:
>
> a) Extract the two attached shell scripts to the same directory.
>
> b) Run the test:
>
>        sh math_tests.sh > mt.log
>
>
>   (This step will also produce around 100 (C and executable) files in /tmp.)
>
> c) clean up:
>
>        rm /tmp/mt_*
>
> d) Send me the results (i.e., the mt.log above), CCing the list and
> mentioning what glibc version(s) you used, so that other people don't
> duplicate tests for the same glibc.
>
> Thanks,
>
> Michael
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
> Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
>
>
>
>
>
>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
