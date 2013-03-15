From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dlopen(3) and RTLD_NODELETE
Date: Fri, 15 Mar 2013 10:28:13 +0200
Message-ID: <CACKs7VBTXTbZvmJKnVw+WcqWNBG6Y9wczZb4tJyUj2rzzs49og@mail.gmail.com>
References: <CACKs7VDM8w7U1g0pQZjTK=_uLFq22kwoPG8WA-Hd4X=jhXTXgg@mail.gmail.com>
	<CAKgNAkge90n18PN5LW3Ff1x9vFiYsJ9G36UOP+v44GR6UJ8R+w@mail.gmail.com>
	<CACKs7VDh1UwO_+D0pFPOCtxaY+=G5OKq4FNGEsaPBHZkYtjzOg@mail.gmail.com>
	<CAKgNAkhZkmiCRL4gcmBMAisb87WBGUVnNHkgoqVCPLLhD8QAhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=047d7b604fba91da3404d7f26b0a
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhZkmiCRL4gcmBMAisb87WBGUVnNHkgoqVCPLLhD8QAhQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--047d7b604fba91da3404d7f26b0a
Content-Type: text/plain; charset=ISO-8859-1

>> If you're interested in the latter, I can hack something on
>> top of the TLPI examples.
>
> I don't mind too much as long as it's simple and easy to reproduce.
>

I've attached a tar.bz2 file with an example based on the TLPI code in
the shlibs/ subdir - I reworked mod1.c to use a constructor and
destructor routine; then in dynload_nodelete.c I'm loading the library
in argv[1] with RTLD_NODELETE, call dlclose() and then dlopen() it
again:

$ LD_LIBRARY_PATH=. ./dynload_nodelete libdemo.so.1 x1
Called init-1
libdemo.so.1 loaded
Called mod1-x1
libdemo.so.1 unloaded, waiting
libdemo.so.1 loaded again
Called fini-1

Notice fini1() is only called when the process exits. Also, notice
init1() is only called when libdemo is first loaded.

I've compiled it as a separate dir under tlpi-dist (the extra version)
called shlibs_nodelete, it seemed like the easiest approach.

Oh, and by the way, great book!

Thanks,
Stefan.

--047d7b604fba91da3404d7f26b0a
Content-Type: application/x-bzip2; name="shlibs_nodelete.tar.bz2"
Content-Disposition: attachment; filename="shlibs_nodelete.tar.bz2"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_heb31eex0

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
FCQaNqrTgA==
--047d7b604fba91da3404d7f26b0a--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
