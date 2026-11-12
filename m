Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505739;
	b=Lh3F94zLDyt20+IZDgffm0Ez5HNGNW2BW+6uoruOhZvC7eGaLjl2asftt0Ke9sisn5TO
	 GciXi/bFyTnd9WhjEfHUXx7y4YGvx02TFsC/CSJR14t3Oa254ApQPX3N+33OIBokjs1Sl
	 rto3D5cs1CEWQY15nc0bBJF0+if2AemDfKCqhvCjRsBvZ29+617s6ylPKwc42gBL51NPz
	 bbe6YMiC1YVBpJmIEDRii5oERO+L52EhKvqY2CzQnkj0dAbn9ZZLz6gVKcUeXhpcxOkF4
	 f9ePANXBQlQwXglRDCJQk1Ay48/uUYoP3zH0tqL1HxbJu99sNh+a95Q8Mu3jKyczQJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=vTJnApBXUZFIP+vjcbFR1JaE/L+70bzr/0u4zwWPgEM=;
	b=UXHo/mNLSo98Fsl/SD6TvJ3jG2kuJX8jNbchPkRW+ZohF5VHyrdN9kGvxpGOQb6Ltspf
	 QfE3mwD9yEF57FLBszxAU9t8mCayMPT6CciHH71s6ViJZ2lEiFgbpdMCuBTnAfy3k35+8
	 QM1BZ6VC8IoenqxJSepYrgYpWK1o1SRryBKurf+k+cYAnunBzvjL6rv67llIcVNZfIV+T
	 DauJGYIcGjXobFNHR6HBifgzzCHPnHxYGgUYugacH8KbW5RXc5b4KvbNUgdC3cQ13IM6a
	 2jb5jTij/j6mb8ia0lMxhJ1O56ATe2aKK/nPS8edmUMwpP4n9PsbLVPCLXADNHrY/EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m1TqYxaj;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF893606A321
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 17:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF893606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m1TqYxaj
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a204ac318aso226365e9.2
        for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 09:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794505737; x=1795110537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vTJnApBXUZFIP+vjcbFR1JaE/L+70bzr/0u4zwWPgEM=;
        b=m1TqYxajjEuHHDJmN5omux736OMeMZj9Pb6lpxd/LHR++sY+otMUFfhA0FaQHIkqcx
         LaGsd7j3S8oovc165FJEQEkFg5MYg5wauuZnO9Cw/P06jVM2Ifwd8aBRLLaMneotRYiA
         x6m5i+hzc/uO/YSQm/T/D7XT+3nmhIxxYCnBQQ3Y+RBIrQJs6x0RDZandcQaHvmxRwe7
         AeofXudaePT0muq5CDoSj3Q6tUBcm1Rph3pEUuglkHZIwqWnPRO8cRktYfJ9CavtQ7iz
         U/Cf/GJRiIihjAwjsHDnWWsE4WeEToY7l+1oEX0uWS0Ctz1gdVSBgakYOi12GL/kuTGb
         AZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505737; x=1795110537;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTJnApBXUZFIP+vjcbFR1JaE/L+70bzr/0u4zwWPgEM=;
        b=krcSWvlRMJZQsSYCeFXTmGSiuy7sCikBriuqGxeKl2etOtHFN0tBUKW5QmClvnm+DL
         SL46tvAAQ9iSKGes37uBBujRmss9QEZt3itf8dHUXCg04ZilKjH6B4vo9+TmvGVxAHpM
         L6SLsdBcYCNFGmK+WVfrtcyuWONkHY2s2IhNPUHMMLUm2uhsgjYAlhx/pumKHHD4UUxZ
         /kM5MD5zSqt3ICn3NMQUqa2Ifa5FHbb5A3D1H0ZbfWPe2d6VC+ad0/1fmfGPBiEXGTuu
         MkPfF7hl9xsj22UN6KT+1Gac3yMEYQDckD2q0e+QifCjM0gU98XOF6C+FqK/wS6wg0to
         sPaQ==
X-Forwarded-Encrypted: i=1; AL+hErFYK1cCZjoHRRAsCC9M4hulsE353cLL1itpm8G+Y1bqQcSEnpLb/kr7BIHick5n1lwOqTMl2h9fJ3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Dmc8o362Q95Wd6oNUm4IGlnjBw/UqJ7fDyzRhcikgo0uIGjdF
	3XaXPJNO3mOMUNqxnjRBMjNMmaL8b2q16IBOetWEXfDvDYudHszbGuawH5DOcGl0tODw7UhR3/f
	cK5/KlQ==
X-Received: from wmbjp4.prod.google.com ([2002:a05:600c:5584:b0:4bb:51ec:41e0])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b2a:b0:4b7:dc0:89c
 with SMTP id 5b1f17b1804b1-4ba093ba970mr121752085e9.32.1794505736843; Thu, 12
 Nov 2026 09:48:56 -0800 (PST)
Date: Thu, 12 Nov 2026 18:48:47 +0100
In-Reply-To: <20261111013137.226288-1-pedroholanda122205@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111013137.226288-1-pedroholanda122205@gmail.com>
Message-ID: <avX7_5l-1kjBhhv2@google.com>
Subject: Re: [PATCH] landlock_restrict_self.2, landlock.7: Document LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS
From: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>
To: Pedro Holanda <pedroholanda122205@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, "=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Pedro!

Thanks for the patch!  Please see my comments inline.

On Tue, Nov 10, 2026 at 08:28:40PM -0500, Pedro Holanda wrote:
> Add the LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS flag (Landlock ABI
> version 11), which sets the no_new_privs attribute of the calling
> thread atomically with successful ruleset enforcement, removing the
> need for a prior prctl(PR_SET_NO_NEW_PRIVS) call. Document the flag in
> landlock_restrict_self(2) alongside LANDLOCK_RESTRICT_SELF_TSYNC, and
> add the ABI 11 row to the VERSIONS table in landlock(7).
>=20
> Transcribes the kernel documentation added in Justin Suess's ABI 11
> series.
>=20
> Signed-off-by: Pedro Holanda <pedroholanda122205@gmail.com>
> Link: https://lore.kernel.org/linux-security-module/20260809154544.125310=
0-5-utilityemal77@gmail.com/
> Link: https://github.com/landlock-lsm/linux/issues/66
> ---
>  man/man2/landlock_restrict_self.2 | 29 +++++++++++++++++++++++++++++
>  man/man7/landlock.7               |  2 ++
>  2 files changed, 31 insertions(+)
>=20
> Note: following up on the man-pages transcription from issue #66, at
> G=C3=BCnther's suggestion. I've left the DESCRIPTION no_new_privs
> precondition and the EPERM entry unchanged; both now have an exception
> via this flag. Happy to refine them here or in a follow-up.
>=20
> diff --git a/man/man2/landlock_restrict_self.2 b/man/man2/landlock_restri=
ct_self.2
> index 3b8f897cf..4cfbd1e6a 100644
> --- a/man/man2/landlock_restrict_self.2
> +++ b/man/man2/landlock_restrict_self.2
> @@ -150,6 +150,35 @@ If the calling thread is running with
>  this operation enables
>  .I no_new_privs
>  on the sibling threads as well.
> +.TP
> +.BR LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS "  (since Landlock ABI version 1=
1)"
> +Sets the
> +.I no_new_privs
> +attribute of the calling thread atomically with enforcement of the
> +ruleset.
> +.I no_new_privs
> +is set if and only if the call succeeds;
> +a failed enforcement leaves it unchanged.
> +Because the call sets
> +.I no_new_privs
> +itself,
> +it removes the need for a prior
> +.BR prctl (2)
> +.B PR_SET_NO_NEW_PRIVS
> +call (or
> +.B CAP_SYS_ADMIN
> +use).
> +.IP
> +When combined with
> +.BR LANDLOCK_RESTRICT_SELF_TSYNC ,
> +.I no_new_privs
> +is set on all threads of the process with the same guarantee.
> +.IP
> +Leaving

This is misformatted and it looks like the patch was pasted into the middle=
 of
itself once?  When the patch is formatted correctly, piping it into "git am=
"
should apply it cleanly.

The way I send patches is with "git send-email FILENAME.patch"; when I did =
this
the first time, I found the website https://git-send-email.io/ useful for a=
n
overview on how to set this up.

Can you please have a look and resend it as V2?

I have not applied the patch now, but left some review comments below, base=
d on
comparing it with the kernel Landlock documentation [1].


> --- a/man/man2/landlock_restrict_self.2
> +++ b/man/man2/landlock_restrict_self.2
> @@ -150,6 +150,35 @@ If the calling thread is running with
>  this operation enables
>  .I no_new_privs
>  on the sibling threads as well.
> +.TP
> +.BR LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS "  (since Landlock ABI version 1=
1)"
> +Sets the
> +.I no_new_privs
> +attribute of the calling thread atomically with enforcement of the
> +ruleset.

Nit: Please break sentences using "semantic newlines" as it is described in
man-pages(7).  (Rather break after "atomically" than have a single "ruleset=
" on
its own in a line.)


> +.I no_new_privs
> +is set if and only if the call succeeds;
> +a failed enforcement leaves it unchanged.
> +Because the call sets
> +.I no_new_privs
> +itself,
> +it removes the need for a prior
> +.BR prctl (2)
> +.B PR_SET_NO_NEW_PRIVS
> +call (or
> +.B CAP_SYS_ADMIN
> +use).
> +.IP
> +When combined with
> +.BR LANDLOCK_RESTRICT_SELF_TSYNC ,
> +.I no_new_privs
> +is set on all threads of the process with the same guarantee.

The documentation is factually correct, but you changed the wording compare=
d to
the uapi/linux/landlock.h header.  We normally try to keep both in line so =
that
we can maintain them in parallel.  Are you planning to update the header
documentation as well?

P.S. I find the "atomically" phrasing very good and clear; for the other
sentences I am less certain that we need to look at it from all the differe=
nt
angles like that.


> +.IP
> +Leaving
> +.I no_new_privs
> +unset is risky even when Landlock does not require it,
> +as it can allow a sandboxed process to regain privileges;
> +this flag is the recommended way to avoid that.

I find it slightly misleading to say that Landlock does not require
no_new_privs.  Yes, you can technically also enforce Landlock with CAP_SYS_=
ADMIN
without having no_new_privs, but that is really a fringe use case.  I would=
 drop
this comment and rely on the existing documentation in the DESCRIPTION sect=
ion
which describes the prerequisite independent of the flag.


Speaking of the DESCRIPTION section -- in the place where it discusses
no_new_privs, that man page section currently states that you must call
prctl(PR_SET_NO_NEW_PRIVS, ...), which now seems worthy of mention, but
technically speaking incorrect.  Would you like to rephrase that as well?  =
As
far as I can tell that is a place where the man page currently deviates fro=
m the
kernel documentation.  The kernel documentation [1] describes the no_new_pr=
ivs
prerequisite as well, but is much more succinct -- maybe we should use that
phrasing instead?  (We also probably don't need to describe the prctl() cal=
l in
that much detail -- we can just link to PR_SET_NO_NEW_PRIVS(2const)
strategically, where that invocation is already discussed.)

[1] https://docs.kernel.org/userspace-api/landlock.html#c.sys_landlock_rest=
rict_self

Other than that, this looks very good, and the part below as well.  Thank y=
ou
for looking into it! :)

=E2=80=94G=C3=BCnther

>  .SH RETURN VALUE
>  On success,
>  .BR landlock_restrict_self ()
> diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
> index 006482c94..e8639dcd4 100644
> --- a/man/man7/landlock.7
> +++ b/man/man7/landlock.7
> @@ -534,6 +534,8 @@ _   _       _
>  9      7.1     LANDLOCK_ACCESS_FS_RESOLVE_UNIX
>  _      _       _
>  10     7.2     LANDLOCK_ADD_RULE_QUIET
> +_      _       _
> +11     7.3     LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS
>  .TE
>  .P
>  Users should use the Landlock ABI version rather than the kernel version
> --=20
> 2.53.0
>=20
> +.I no_new_privs
> +unset is risky even when Landlock does not require it,
> +as it can allow a sandboxed process to regain privileges;
> +this flag is the recommended way to avoid that.
>  .SH RETURN VALUE
>  On success,
>  .BR landlock_restrict_self ()
> diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
> index 006482c94..e8639dcd4 100644
> --- a/man/man7/landlock.7
> +++ b/man/man7/landlock.7
> @@ -534,6 +534,8 @@ _	_	_
>  9	7.1	LANDLOCK_ACCESS_FS_RESOLVE_UNIX
>  _	_	_
>  10	7.2	LANDLOCK_ADD_RULE_QUIET
> +_	_	_
> +11	7.3	LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS
>  .TE
>  .P
>  Users should use the Landlock ABI version rather than the kernel version
> --=20
> 2.53.0
>=20
