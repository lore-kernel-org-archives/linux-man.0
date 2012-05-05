From: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Subject: Re: realpath(3) bugs
Date: Sat, 5 May 2012 02:06:19 +0200
Message-ID: <20120505000619.GA8038@iq>
References: <201205041122.q44BMDEO002270@ucsinet22.oracle.com>
 <CAKgNAkgjjKXx_Aw5iF_Phe7c7ixpqtfLSiV6fkTttN5ge4CGww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkgjjKXx_Aw5iF_Phe7c7ixpqtfLSiV6fkTttN5ge4CGww-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Casper.Dik-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, May 4, 2012 at 11:22 PM,  <Casper.Dik-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:

>> For some reason, many of the realpath() manual pages (BSD, Linux) have
>> words to the following effect:
>>
>> Solaris may return a relative pathname when the path argument is relative.
>>
>> I have looked through the Solaris source files and have found no
>> such bug reported or fixed; the implementation from at least 1997 and
>> beyond certainly doesn't have this problem and even the older versions
>> prepend getcwd() or chdir() to dirname and run getcwd() in that
>> directory.
>>
>> realpath() existed in Solaris 2.0 as it came from SVr4.0 and even at that
>> time i t returned the full, non-relative path.

I wrote the Linux man page on 1999-08-24.
It was first included in man-pages-1.26.

The note about Solaris came from the 4.4BSD-Lite man page realpath.3
(dated 1994-02-16) which says:

.Sh CAVEATS
This implementation of
.Fn realpath
differs slightly from the Solaris implementation.  The
.Bx 4.4
version always returns absolute pathnames, whereas the
Solaris implementation will, under certain circumstances,
return a relative
.Fa resolved_path
when given a relative
.Fa pathname .

I forgot the details. What happens if some of the directories involved
are not readable or not searchable? What happens if some parent
directory was overmounted so that there is no absolute pathname
in the system that refers to the same place as your relative pathname?

Andries
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
