Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793392171;
	b=E3B8QJNY3riePhL21T1pXTwtJcII6JNSrkdPx+dlp1FBiR7uihkgbPHT8PQZwVr6ppXR
	 YWaSWuVX89j1y1E5MGw+WEgnHaSbA2skAQB+VlfJoOaFsKBlNa/8cH5XSFexPkIcEOaD0
	 sdcMCPZ9iXjlZRn1ZsVFEdTaOvHniPFEF1kIYxcX78HhMGTswqkgKY31JNUcBUeuzdCZX
	 F6sA6InRZL2muUSWYSBz9D+WcNqPmjjX1n+dfYvLZoCMhAMb/cTQ/5vZAfnHVvKhPXK82
	 r34QzLBIHjYENYsZXqQXFKwamQfJXFsK6lxhTgftuB6OXFY1tq23fGtN0WkHFMFMhGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ad/zPBDkBN9UmIWCjIUKbjjtUG3AqGndEgXjle1qKZ0=;
	b=FK4ZnhQwDUa4E+ztvFzG6JpWQ4LpN2ciuWlfJalCMUyTB0DglBNw/JepGnjCwWK7FU/2
	 ChMIQ64L/ZkMhoOWIubtkSmmCLoleVp73u4ZEbDelcY7kaOvjizMlJwZ+MRmmjIl9RD/n
	 mynuPz3GmTCLDun0vVNAy7n5fl4GpFkn8CvjXxQ7aDflCm+48NWnts/cUfaRcfR7zGy15
	 qzMj2p6ubfv4AbYnl3GCR2xqbouNClWew1N52k8Cgpmt1n0aemcZ3uj+v6TRq9/A36hqK
	 TRdHGBW+7QDYpcfziCQL0rILpzzzEYAHCjB8i9phqEdYy05rAQ5IvVEmk8TpSD6Vkvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5qizHJS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5D1606A31C
	for <linux-man@vger.kernel.org>; Fri, 30 Oct 2026 20:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC5D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5qizHJS
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so1155035e87.2
        for <linux-man@vger.kernel.org>; Fri, 30 Oct 2026 13:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793392169; cv=none;
        d=google.com; s=arc-20260327;
        b=ZEc76xysdJkpunrJH8jTyKRzRX8d6g3q6Vq5kDkGogdaxh2O4DqUWCvMVtKl3iQ4B7
         g0+v9YABmhWWogh4heagqx1BCNPJKr5smKEDkC6TrQTYcgPJdbnlGWAhtq88eE75WZp1
         iD42AlkfsjA0ZlMGoAN36ciFOo4rZAYpRWbG40coAbsWT3YXkEf6d1KWaacUNxMof8GC
         XAkTSv0anBiOXLYygQ6ymysijAtGbivwy7P5fpfrqNnz8d9SWdvuuac5OZpIV5RBEh7x
         E47i8JbhamqFJa4HB1ogdDuJdeOZBulx/VP/XIJtAef0fMZvWk7Lv2OtJhEOt00D+JQ8
         G/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ad/zPBDkBN9UmIWCjIUKbjjtUG3AqGndEgXjle1qKZ0=;
        fh=kQ48aT3RHrGsLkl+l7LrL4W43JzpbOuthkTPrszFUq8=;
        b=p8lj/pKzdPO8do4RwzOe5hGMSnEWCnSRxUiqaDEcggrpx0d4lR3Y3oX7tm2b2iEPhs
         s42B+rcxwVYjDTvGpzDlqwqEMhp4IvvlaII3yGcd4W9Hf8bJYK56XOOEx6+oLcgMrg4X
         5VG/ogSkrQLR10GwB9VpNVnyuucXE6EnJoAZsl599wMeRorLzutYuwMMHaQotPD2/8xb
         xMek5l9R+fmE6hq0gmRjL+xF1hvzhun2xwSonM3caUt8P/uxN7furKEZwY/4ld38N/a9
         EoBjwPTulmTmk0rF7ttZZH+RRJum+5UQC+wclym6858InwRoBBCcJ5hqH/WoJ9Lu+ZEQ
         v85Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793392169; x=1793996969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ad/zPBDkBN9UmIWCjIUKbjjtUG3AqGndEgXjle1qKZ0=;
        b=p5qizHJS58uDRkSFclfODiNZNxe6x22kNqMlq7nOrsog7QMDi1N7+JBumZiuuBBqkm
         B8AaTpgPiNmQdsY3E3vmRJ/uQW9syjJuIhKg+DA+d+1t2pc1NdDbexU5QOjd+JUFlBUB
         8yOAKlf/pI5GHeUkbIkjMFxSRSVUGNzzw7wkelC1FpmO0d2ZCMCRzZ9H6YE8+OPmkB/j
         CxxlRTfybEcSaL16jVLZBf0nUsGXOnnu6BQ/xopdBZW9MI5VbqZe0/eu1/cpM8lSYXwU
         v8trkxEmDRZAHXhvNmWc58bZzgkbJVaD/NXDrkt5FLe9YIVsaKLCnpiNkwvdemcDyxBC
         6NEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392169; x=1793996969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ad/zPBDkBN9UmIWCjIUKbjjtUG3AqGndEgXjle1qKZ0=;
        b=ok/xQ66j8/0+Uoxn27KaCvaKtxhiPFCLcTT1YyRx7pkyjcmiDLSZSg1PbKfGxx0J1m
         SVX42UX+5omDw7yHhN4Mc5j/OQRoBx7eFemL8UkyEUVxQtCIpej+so33L87Q0GV6GdQD
         Fzvbek3KuDDzLWjs9P6v8cKkJiOvDKKIfOuGkM7joQpeUtUzX4WbMyxPL4bYBw3UcAP4
         p+kXUfk3iUXpMJ1LAJoVS4uU9sKm1H2SUXon6nTBbcxBltfaShHwT7J/CHigoM6DPnHu
         gQa0K7hVQ2IpI8v6MWu9NlZWY1KoJH7esiVPTwOx93hRR8/g+HBpRtZjRochWZTwSDVW
         yFYA==
X-Gm-Message-State: AFq9FYLCNoQYJWKiCjbn+cr0yshHpnwxB4PWONryCLDJQ2Y3KWBdfabi
	9xDQOppGhi0QRjW2CpcJwX1bl1hGq7Mx/k0ICCIZESqBJkYzS57YIxML8GOw41dCWKKD56W3rxf
	gLx/+d3hs/tZH3IkF9dHdwoySlRlYSrMZQA==
X-Gm-Gg: AYBFou0uIbr1C0wLGhKmWzTRMAhuvADbO48PnHkvd7ugn+FkiE7GE4RhDN7bjO1Zvo6
	5swowIid+oFtuXia3IPzPnzouN5cxAChHiV7hxKX84/jRakPls1zmjrwMgaME4mXPVK/Ch2ybnf
	yAISAWCTvPEh/MPxsDOu9mHXMNQxD40vY+DZXre4O6sUMS5EhG/pqR4A4nd7Z8f+UgvX9PD00w2
	BmWLcKDBV1byEPcjtqFHj8BFQ43+TOJLBtNciGrNKR51/cBhXKic3ytbpkwG3jiMfo9Qur4Upwr
	Wc/FRvYWczQ91jKqeiuS9bDVR0a4RBsTt5BXIMQBO9xDSGHFV/DauCni9Yo0x5y894g7AWknwP0
	LF8+HN67150pKuQsL5ymcyF7r7vH0cm7rIsxcrQ==
X-Received: by 2002:a05:6512:2243:b0:5bc:f2fb:f4b8 with SMTP id
 2adb3069b0e04-5bfd95847damr1145808e87.67.1793392168914; Fri, 30 Oct 2026
 13:29:28 -0700 (PDT)
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <auFA7dfNv4jk3R9e@devuan> <auHu-XoGs3jufdhY@devuan>
 <CACKs7VCkdNRyfsPZU-859vjPzfeHTPo14gj3Ezgu3JYEGLyiZw@mail.gmail.com> <auPFMcZfChP7YxMq@devuan>
In-Reply-To: <auPFMcZfChP7YxMq@devuan>
From: Stefan Puiu <stefan.puiu@gmail.com>
Date: Fri, 30 Oct 2026 22:29:16 +0200
X-Gm-Features: AclHuK-xfxVw1p65dHD6qMzVXZk7ty7FDuZWzGPmLOUAv6xa7Oc82j-3S7-WGB4
Message-ID: <CACKs7VAP428vBPU9ctPG94FYPBTmfa2vHcoknZNGk77cps8q=Q@mail.gmail.com>
Subject: Re: Serbia
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 12:27=E2=80=AFAM Alejandro Colomar
<alx+linux-man@kernel.org> wrote:
>
> Hi Stefan,
>
> > Date: 2026-10-29 20:49:06+0200
> > From: Stefan Puiu <stefan.puiu@gmail.com>
> >
> > Hi Alex,
> >
> > Sorry to hear about your Serbian "experience".
>
> Thanks!
>
> [...]
> >
> > I'm from a country neighbouring Serbia - Romania. I've been there a
> > few times, though it's been a while - in 2007, 2011 and 2012 (the
> > latter two for the Exit Festival, which was quite nice). In 2007 a
> > police car stopped us and started checking our papers, and were a bit
> > aggressive verbally, but eventually they let us go, they did not find
> > anything wrong. They only spoke Serbian, which I don't understand,
> > luckily we had a guy who could translate with us.
>
> The cop that stopped me was actually quite nice.  Other than the evident
> discomfort of being retained for so many hours, I must say he was nice
> verbally, and he was very transparent when searching my bad so that I
> saw he didn't take any money (or anything else) from it.  And he spoke
> good English.
>
> His boss also offered some soap when I went to his bathroom (which was
> quite dirty).
>
> And they didn't hand-cuff me at any time.
>
> > Also, they had a
> > system where foreigners had to tell the police when they were staying
> > somewhere in Serbia; they were a bit pissed off in 2007 when we did
> > not have the paper from the police when crossing the border back to
> > Romania. My impression was that they still had the old police state
> > behavior from communist times, and also suspicion towards foreigners
> > of any kind. Were you there before the elections? Maybe there was some
> > paranoia in the mix as well, who knows... Ceau=C8=99escu was quite para=
noid
> > before his overthrow, he was suspecting all kinds of foreign
> > interference, who knows, maybe Vucic took a page from our guy's
> > manual.
>
> Hmmmm, I entered the country on 2026-10-14, the incident happened on
> 2026-10-15, and I left the country on 2026-10-16.  It seems I was there
> 10 days before the election (I only learnt about that election yesterday
> night, after writing the email).  That probably made them suspect of
> foreign interference, indeed.

Probably. The country has been through a civil war, was bombed by
NATO, has had a chauvinist autocrat in power for the last I don't know
how many years... A climate probably very ripe for suspicion towards
foreigners.

If you go somewhere with big groups, like festivals (I mentioned Exit,
for example), then they don't care, but a lone foreigner might trigger
some suspicion.

Regards,
Stefan.

>
> > Anyway, I hope you are OK now.
>
> Yup!  Thanks!  :-)
>
>
> Have a lovely night!
> Alex
>
> >
> > Regards,
> > Stefan.
>
> --
> <https://www.alejandro-colomar.es>
