Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F797305690
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 14:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767903; cv=none; b=e7he80gwwiXByE+P5qNYYUP+OgFMrd5AabEGf7MPxi+heyuZ0DwSzYH+dl1f7Zlt+vhhfVH55O3EMNaVVgpd1bZCiHfu6S+82XQD85TFDrC4CKPrcBDs+EZMYy5Wq9ajnzFlvkiOm5+2EM2+xpe9TXQfmFUnnR2g6pzu1celVbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767903; c=relaxed/simple;
	bh=irZnAsvamN8tpznHTXd6t93ps/jOrb3It+wRsBcW8K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sa5SaTAHWLW/w32OYvDs88vkM5r0024pbCE0liP6CSveCV47aziVbdrpliMO8s6RWVQhlP5wgbiqCF/+CxfXXbr61buLHIpyZ/nFzZHkDFqfaDp/VshS4DGa7GV9bl6Jfu7NWBBmnSmcMagA/MzY4WFlq7OOULH0Tk+wOGFvGz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xhmb7iRS; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xhmb7iRS"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81ed2a00f12so49550477b3.2
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 07:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767901; x=1786372701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dFlD+hSTFF7NY7UVbn+g3dpsTiJD66NW3nq1+zi9hgM=;
        b=Xhmb7iRSnerJt59hazVZ2e+bhT4fSWy7ICDSf5Rf0O97AIg7fWy1Tjl/dgfWNfCm+Z
         L5pHPsF/PFKO8klxNzel+h3VWZ+aEg2+7/8O6Em68znoaU3TDs7QsGnZkS8qSvxqKS9A
         V9AT2xxhM0wBQXPkn0M6rl15L/5netrYps4D6+66FbUkK+UFy5TcPj87SAni7LEqAuDg
         zGyPORhgfQuuyjSbBkdD3y2+jRuzZbb6fINdZUqGIrkSAoUvDRh+l23HGK8MRQjNoupF
         UgHYzKlcWDhBdtpEyqwx5t/zIFSc+qFmmV0NLMbvzX//3nNQgK5AGYKU1RLx8pq3kmBI
         7Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767901; x=1786372701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFlD+hSTFF7NY7UVbn+g3dpsTiJD66NW3nq1+zi9hgM=;
        b=Zk3V4fO//Hyg785eVvNygoe0qgbCdN4L/YLbprOq7mInGBXQgvD+JmH+Jz5UJG+kWu
         r0abAFVwFvW6rE5Do39PTTWS3gqTC4iaOq6gw/wjgVkfDICWA2Hg/m3v71z8GyAjYvUI
         E9BcFoHLyh25gDUUNm2VaRMVI4Umr4v+qhH63ubMiA1gotALIXx4bRmfV18Sx8fsFVel
         7ig/qJYyt4Bhwl4bfZhxAPkbwMZ7/TprxoZhpt+nwjt8tClOaHq2yxcgtQEk1P9nH200
         eQA+cIEaa6BHqZ1kpL2scbTPcw0FjzadoBMnUcxUDo3Rmlw2l5l+64/ArZ3lrU8PEo7B
         XjWg==
X-Forwarded-Encrypted: i=1; AHgh+RruQKH5lq6wb+fsIa7PIf0BludujKWtIxiaArdHui787fEdw3b21cxLAWaxdSDrj6PvLXKtvRG1pW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSGzyRL0oC1h19+mIpSea8P21fdy25YuSD91BhMjIQ4x4H/hN9
	ApdiXHne7CnmfX6zVrxYsk0gfuU8zN+sQDWXVLdHpjlV+g9kx6Ls8IUC
X-Gm-Gg: AR+sD10fT0t3Lv7UeWX51pbQrfg131GmK3zukPWnmi5SU6YWMvi11Nd+LC0ELjjXRF8
	TwEunite561hbTW1lLz/Qu67aVEmg00gJl5ndd47WJs3ekxixYw/BDnpMBvfMAtl37YRESRxLD/
	I308K7+YsJYieRoOPtTOLgSN0afyM7yjuPCr1UvCLGgSIroNkERwfUDkwrNKcE5WwOymQTbgypB
	BYk6Jjx1ZjhLpuTNfdmXO8gE/5cVF92u8bIVnIDiObjb6WM6oGes9Hs7DHyTJDUI3+3ETZETMuj
	Zb8DloN3X0ArW/C2HcHD9U1hy19t7d5J7QOz/SIFODtbTeHuIAn16QhyBxSbCitylfx6117csF8
	dPK4JBueZHewVhv4Z/ZfkRIhYCIJeY0Nm5t8JLwXumoDJGguY+G5VPDIF7fJfjrS4VUl8bhpq3X
	2jL/fg78VOj6O3bQQEy6AisGoDOhjyQshS34cNDchH7Un+pKAtjg==
X-Received: by 2002:a05:690c:7244:b0:816:b469:ccfd with SMTP id 00721157ae682-81fd4a5a244mr135664147b3.15.1785767900758;
        Mon, 03 Aug 2026 07:38:20 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0fd97dsm54660627b3.34.2026.08.03.07.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:38:19 -0700 (PDT)
Date: Mon, 3 Aug 2026 09:38:17 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Joseph Myers <josmyers@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, Sam James <sam@gentoo.org>,
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>,
	Mark Harris <mark.hsj@gmail.com>,
	Nevin Liber <nevin@cplusplusguy.com>,
	JeanHeyd Meneide <phdofthehouse@gmail.com>,
	Christopher Bazley <chris.bazley.wg14@gmail.com>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Iker Pedrosa <ipedrosa@redhat.com>,
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>,
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org,
	libc-alpha@sourceware.org,
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: on glibc forking/reclaiming its man pages (was: on the
 irresponsibility of pursuing C language reform)
Message-ID: <20260803143817.kvq3m5wcx6vvspul@illithid>
References: <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <20260801213421.7e3wvyjwmlwxzd55@illithid>
 <am5oWn8dYoP0r2dw@devuan>
 <82eff373-3460-3cff-4ed5-0a04b4fe4fad@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bdyw23mt5wvqvtua"
Content-Disposition: inline
In-Reply-To: <82eff373-3460-3cff-4ed5-0a04b4fe4fad@redhat.com>


--bdyw23mt5wvqvtua
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: on glibc forking/reclaiming its man pages (was: on the
 irresponsibility of pursuing C language reform)
MIME-Version: 1.0

Hi Joseph,

At 2026-08-03T13:42:31+0000, Joseph Myers wrote:
> I suggest we need to figure out how to generate man pages from the
> glibc manual so that people who prefer documentation in that format
> can have documentation of glibc interfaces that's maintained by a
> proper consensual process rather than following one person's opinion.

I speculate that Richard Stallman expected that this sort of thing would
be soon implemented and accomplished...in 1989.  Or earlier.

Official GNU documentation continues to suggest that (Tex)Info shall
prevail and that man pages are destined to wither away, as Engels
predicted of the State.

https://www.gnu.org/prep/standards/html_node/Man-Pages.html

Speaking from experience as a GNU maintainer and from observation of
others, I assess the task you outline as anything but easy.  Chet Ramey
has been maintaining Bash documentation in parallel man(7) and Texinfo
forms for decades.

https://lists.gnu.org/r/coreutils/2026-05/msg00044.html

In groff, I maintain a ~300 page Texinfo manual alongside ~400 pages of
man pages.  Overlap is only partial; the Texinfo manual focuses much
more on specifying the formatter's behavior in exhaustive detail, in
about 180 pages of the total length--much more than half when you
consider that about 60 pages are given over to indices and the GNU FDL
license text.  The man pages document groff's preprocessors, output
drivers, utilities, wrappers, macro packages, and so forth.

https://www.gnu.org/software/groff/manual/

(groff's Texinfo manual will look much nicer, and additional manuals in
PDF format will be available, in a couple of weeks when I release groff
1.25.0 final--knock wood.)

At the same time there _is_ substantial overlap between a few of our man
pages and groff's Texinfo manual.  You can find comments in the source
documents referring to "keeping sync".

I perform such synchronization by hand, and not perfectly.

Even after years of experience doing this, I've found that nailing down
the parameters of what would be required to automate such
synchronization is tough.  Autogeneration of one format from the other
would, I think, be a closely related problem.

If the task were easy, someone would have done it by 1990.

If the task were of medium difficulty, I suspect the Pandoc project
would have solved it with a Texinfo reader by now.

https://pandoc.org/MANUAL.html

They haven't, so far.

On the bright side, I wager that a domain-specific translator to get
=66rom a specific Texinfo manual--likely one that imposed special rules on
its maintainers to enable extraction of data necessary for man page
production--could be written.  The job will demand someone with solid
domain expertise in both formats.  Better, such people actually exist.

I'm available for consulting work.  Do you have budgetary authority?

Or, you know, there are LLM coding agents...

As a third option, we could lower the temperature just a little bit.  In
an email on project management that I'm still drafting, I implicitly
suggest that Alex do the same.

Regards,
Branden

--bdyw23mt5wvqvtua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpwp9EACgkQ0Z6cfXEm
bc46vw//Uy4oP4rhXtBMH2OyscJfNAy/aSRS0DAbucPfrFWvPIUxJ/6ckw8eBVgt
yocwLFOcjtghAqcfwGh04VvHROSSw+jl07vrM0T5dj0PnEhzrjSFJ9EZPSsn22vv
iuJ4JEhP71ikh2PFf6GbVMJpcmDX6eVmuiTZQ1v2LvP4nZQZGepIj3gbKTJVg0Nf
6lTfb9No15O+LFvc+KU5wvOMu5xDA1dOL/K5uI7JWqeNH+bNAtJ0vDrYU4wwuJz9
v9qa96ZqfWhEBPYEt+jz/pm5WkoGGv82eJSPq/BVzi2TGEnynfSZLR8Impg9pt/g
y/qlhJOQLVQezmiDQPTm9LwHNarROQa2dvNE3zRRaE2H8veX379XGqbBlBJmD3XS
kp4EnA/DrgtpQvXh02dKnZ17vesnm00kbc3C7R0slwRXLfoP/zbSpPvHeR6Z3AR1
/9zan0MIxMUxYjf+wYM5sigQrDlHP2MWVtVekhiIMzJASSn6Z8Qk5UXmZZp+F3Zv
nFmysfOJMjCUKQzl8Y8g6Wm3fx7MKSSdtE9B8/bYNL+PWzBzJAPU/84I6VoE99An
Yp7J+SAvImijNsEhzMvSS9Kon3jHFJ5566AcKlZwTjl270Q0oUmfc0/ks7ceb8Oe
yLXFua6VgtvP1rCKbQEjkaQcSmFYFUwx2ZGBWWl6BIisCzw6xLc=
=/AdK
-----END PGP SIGNATURE-----

--bdyw23mt5wvqvtua--
