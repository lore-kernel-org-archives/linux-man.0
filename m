Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A643CB576
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 15:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792338894; cv=pass; b=dNndmCy6IOhaI/kdfpIxGr6qVjduqqpsJEp54qJQiT1GMl54Mt8IZPfIy+TTUG55kQr7Bl7yeDRlIghTPmNYywXCOEBsHnNJ21QZ4G7WieuS3Q9OpGww7pjqJQoaL8N3jprIDXfzIjmEFmCpe4rFlutMQQaF+ccdi0NqUlLcdao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792338894; c=relaxed/simple;
	bh=GSO3CyviX3Qgm/6Zh8OnLHBZ1RQQFZp2XJC7uhyyykE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UTeNteIv5BiH4P3qnOpSF0qwA+m97C3zcGLdkIlt5QKtkWUFVpv/adnu8Wct0dRXalcRHgiNzB9Ka8XPYi6CpoMAxCkU1hTVpZu3HF1PKHA8iPVncyVoSFUjo3UxF317zO2CrS/uxHs7pp/e1kpUfO8yECeZ4dL1yfQ+yuSk5Bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b=OABw59HL; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b="OABw59HL"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a98f260f85so9469361fa.0
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 08:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792338890; cv=none;
        d=google.com; s=arc-20260327;
        b=b/D8MJPfEWlX2rMpfYJKwgyqEtrK6oLsdKqlUEKAA/unv3RsyppszlPNi2bnOGslcX
         DGSOgS53X57zG9ug1iS4mXkhl62lk+v6i9+aixSEEi4nRsp6XgOJcIdtYKFKHMMTIEW2
         KLAIMSVPm8tZLW9m5k7qL8GdXZluyBrxC0pnECG65HhPbkE/mDOjz5BEB1BLcn4porsl
         WE56DRctScY2b+TIr5swcaNYCim+0lEXpomCn1yFC9ua7HLCjYX3fuhP+T1nmMTTwA2x
         pY5eu+15/JvifT0TnQy99IlrXe7NfRBHWtzz7zbNnbb/BXnbBEQzYpjVwbEFt6xuRPav
         55kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kO5X6otFTHv9MhsD7Y3qo3wUX3N68xG5x2FhRCd51xE=;
        fh=m6tHGgG2Lr8PqElEKQP50cwhuMOfN+H0ND4oG432Zos=;
        b=Msd34KFPHOnARaE2RVjvXplR79n7a+xul9Sh8yIxzfObRUC+QzCCowdX38PufO/ssF
         pSgM2Q+NExHfKrbPaE144gQYgadxyg8W7N2ZrkiagMeJXKzwpiSpqYm1iZorCHW9sUid
         H9qC7po5QpzWSxSf19IuzJ/pUXhyhtxpyZtcauhCwGfloe4+cdWCm/DCkgq+Vqj60XWW
         a/kJEOqdrQHohvC7bOt+u+LF4LTPHLfSzd/QCTwj7fRKX3HLyEwQN3h/AL2ICrnpsfQi
         EDTlhOgpVkcde/zOM16ap2LkDSD4rqR5eyZP5NDOuiq5/K6TrQMv5+rVwOk85JbCwVUV
         9NTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1792338890; x=1792943690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kO5X6otFTHv9MhsD7Y3qo3wUX3N68xG5x2FhRCd51xE=;
        b=OABw59HL5A5/ZXntAXfOJWe+sZPCBqT6MYAVSQLybB50/N+7mNx5mRMPL2UkBmDEEe
         SP7HCa+1H3AaKgWgJf3U6Kp5T/eJrKy3oLMFYt5KSilpphp+vfIyAxsSL2PbPJNTvq5S
         gTrDZM2dGXh/TOdODPZche1DC4tvqyLezREa/nN1KXgQKupqTsHfBS/e9MiPHfP0chxi
         yZ98sas5YxPCRwkrP6+/2mPHJXIca+ljSjskYM5XTQAhxwy0eC+5m0HDNaEzofMRHDq8
         /djDbjCo6oQgOLmFbXw6+ackhKuOxqa0vHu+ze0nFcOVWpjRj7haRk67jb5XWb+SUa7S
         7qLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792338890; x=1792943690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kO5X6otFTHv9MhsD7Y3qo3wUX3N68xG5x2FhRCd51xE=;
        b=Ak5JdWareZXyYUm6sRhShEpLvXPEu5s4E+L5wRu1ksKfYKqP6ekOydETxoYB/OVNIU
         PmGJ6KEH2Pmvllgp04gRgBnqibIxFfDnF7/NSB9sh05r5DKU7aHzZ1ItNCqzxKVp9poA
         pzNkWYuXkai9hMyGfaSLqas6FS96tx4LIH/Qn9Wz8W87JijlWrO4ZSFX/jce7XsSiR2T
         G0GcteaIOoGlxuCyIFRTN1+sNpDBuZOdBE1BgWlXHBYfIhcBH7Eaq0ZunLBt5IdiyztM
         jV1E9/OXLPWGc4PWaqFsaHwwDCPhaRQBDKfevDXWX/MeYsOWBtne1DSY1N8PblDp6L0f
         Ulnw==
X-Forwarded-Encrypted: i=1; AKwUvBwF7KqWHE3pbLsNuBgY5Te3ui1SEZWowxX728uVpNkEXVNJ0V2lL3PMbDDgi2aCNQyQQ93jTHt/DIw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBm+LjdwesRIXs6XlSmnyAnIc0CVYHacXOTF8zDwrJ5T2SFpYx
	zSzTSDYFxB0vN5+5zFJji+fAhmAmIO98LHB7CPhrVDyHd441rs8jTqjwt1rBzHRvQKn+94VBQdz
	fcO1ziF61/t6GOmGTAKWf221UqwXV8d13F9CVa1gP
X-Gm-Gg: AYBFou2OBVKLE/FddVt17ZZ3ZYMxBChvDonluwfMjai3GlwldAm4K66K9r6lQisUdtq
	fOqkE7W7aw20cMQidiXz7enRNCgq3DwFFABGLQWq+irAx7Ewx/2MMWGlUHObD+mcM8HWeucLLkk
	Iy+bKpeRHhYmWRIy1Xpvu+AF8SDKsy/XawVHcsXHhmxDXUx30v/q31zJj1RSwLOU2s8/EcmQ3dl
	Hc3LfY9b40oCsJIaohSK4g+aLWhfekrKLdq89+AZdYQ2t5m3kUeZecgJQGo2ayn8RNkaaYkNpuo
	L0iz0MAE+NHsETaMd1YWS3AIFzq8tw1qIQpun5mynMoWzMeKjFOi
X-Received: by 2002:a2e:b8c3:0:b0:3ab:3d02:d03d with SMTP id
 38308e7fff4ca-3ab3d02d528mr3467061fa.13.1792338890230; Sun, 18 Oct 2026
 08:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <trinity-4d271f4c-4816-435f-b8c9-53eef0ff29c7-1786468770978@trinity-msg-rest-gmx-gmx-live-d7f776569-bpnnk>
 <asvEtnxChV2-dELG@debian> <asvFcQvNlx6Oq9Gc@debian> <87ecdqewg2.ffs@fw13>
In-Reply-To: <87ecdqewg2.ffs@fw13>
From: Andy Lutomirski <luto@amacapital.net>
Date: Sun, 18 Oct 2026 08:54:35 -0700
X-Gm-Features: AclHuK-ONu0WZqaFQArRp5-Ytqy3yAEfKAXHMGAs_i-9qeGWkiZ98IFU7IqaU-0
Message-ID: <CALCETrXnffZfmjjeq=wgfHZJorF6Y=owzBJM-iQ=8j=q0k0Xbg@mail.gmail.com>
Subject: Re: Suggestions for an improvement to the man page "iopl - change I/O
 privilege level".
To: Thomas Gleixner <tglx@kernel.org>
Cc: Alejandro Colomar <alx@kernel.org>, =?UTF-8?B?RGFuacOrbCBIw7ZyY2huZXI=?= <dbjh@gmx.net>, 
	linux-man@vger.kernel.org, Ingo Schwarze <schwarze@openbsd.org>, victorm007@yahoo.com, 
	t.piekarski@deloquencia.de, linux-api@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 11:16=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> =
wrote:
>
> On Sun, Oct 11 2026 at 19:26, Alejandro Colomar wrote:
> >> > However, as far as I can tell, all mentioned BSDs have dropped
> >> > that functionality, but NetBSD and OpenBSD retained their version
> >> > of iopl(): i386_iopl(), x86_64_iopl() (NetBSD/x86_64) and
> >> > amd64_iopl() (OpenBSD/x86_64). FreeBSD and DragonFly BSD set the
> >> > IOPL of the relevant process to 3 in the kernel, when the process
> >> > successfully opens /dev/io.
> >> > In other words, the BSD projects all preferred to drop their
> >> > versions of ioperm() in favor of continuing to provide user
> >> > programs a way to change the IOPL. It is interesting and perhaps
> >> > noteworthy that the Linux project appears to head in the opposite
> >> > direction.
> >
> > Ingo, Thomas, do you have any comments from the OpenBSD and Linux sides=
?
>
> The 'iopl() is slower' comment is just voodoo as it really does not
> matter whether a syscall at setup time takes a bit longer or not. But
> 30+ years ago syscall performance bragging was part of the game :)

iopl() should actually be faster: it uses a static bitmap instead of
copying it on return to usermode after a context switch.  See
native_tss_update_io_bitmap.  Not that any real application will care.

>
> But as kernels might have the syscalls disabled or security measures
> make them unacessible at runtime, these syscalls and IOCTLs might be
> indeed just nostalgia.
>
> My personal preference would be to just delete them, but if there is a
> legitimate use case then I prefer to have ioperm() as that allows at
> least fine granular permission checks via the syscall security controls
> instead of having the binary all or nothing iopl() mechanism.

iopl() is very low maintenance these days.  Is there actually any
reason to remove it?

--Andy
