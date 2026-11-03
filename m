Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732343;
	b=UpDdmv5JoV5BgbRXO37HEEa3dzrJbX91pZt7+FMiX722WzSga7ihsmAmxWi92xonaCnN
	 NCnQ658rLfIDQ9UQaAAF94N2hRPhSUloKzaESm/K8T66e722y07K+bUcC0CEw2i98J5Tf
	 HS2OTaYQfeMJG1/HbtnX2U74goE5Nm/6uU0dnRnz3bMfk+MCx3JJv7ur6W7bdOr9gx+Fl
	 dkw0+E+dlx44EVflIS0z0FDua7tF5eQdlYnHN+opSoxP+ELkt3nNbep7YjBAkVI34AHZa
	 i8IhxovY1o74RZvd0v0kwZL4z5JLViSXiPx8JRmyoa/8yxDyCHa48zKXOu3AWWQBqXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=1Wbsp43Fa6aFw9epguEpPobLT58v+8Xzrkt2R9blsEg=;
	b=Vq7CAB384V2slCEAbp5dT2rYDswTRO9PeaAwBdZBK2ScAyIpdH4fxh1v+Qr1FCvrVdZc
	 ecGOIGhmeOCBoT0LSPwa4EKKt7VYdPmgjgNyk4YDJR83FziuoKaDa8Tge1dgkOm/ofsVh
	 7BJ8alMWZZ/s/JhGXWkl/aHa8SF2xuK5sMjkpWPL6ntXtRUYC+dhrFv75I5sEQimCpaxc
	 QYDSXLH/YRf+gzfYAyd7PoO6yvlChBMidxdtzsD3lnl7Z8ZXGm9pwZv4zLXizdF+yRE5M
	 vYTDDfgqo8531nqgMluqLriTokhltKXYBsPbRheKd7Sn16bLUXueJwC0KORUFlVKUkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1ICcvXW;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C78606A328
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 18:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C78606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1ICcvXW
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so6552625e9.1
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 10:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732342; x=1794337142; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Wbsp43Fa6aFw9epguEpPobLT58v+8Xzrkt2R9blsEg=;
        b=m1ICcvXWlLgZ8HrFSbn3ZT8LqlzZcCEayaFDSfgehQ9vz+DkuOgEesLrPPksZFcIwz
         DbcS520haEoj2QtkKRq+xVJmtyUcbekYTAVgOD4Hl4k+vaigq/FPi3bidgjGBWz9ilLc
         gf03XRh90KNnAJJs+ib9Rn/+ggXek87oZO4WzSBUYlQDUvkDnjlJJNguAj0rbQ42PPi6
         5dJWBUGUSwoq2KUFREOnDWhj369/FXS3R05yqV4dl2ME+GAaX5xVWQaYyFdkRhQxgefp
         wxSdrRTohRpf0IFJVTFQL50TF21DJ4uWAHnai5+bYnimbCZUptwyCviI47c/8lZZUJIu
         qUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732342; x=1794337142;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Wbsp43Fa6aFw9epguEpPobLT58v+8Xzrkt2R9blsEg=;
        b=ZxObSZz8E0yWul5D8KpRBIM7qDGABfzfx20B2zGtIaOv3ScjWKPmsthSn7yRC1ZiLh
         MURLYxwGcDQp+GLqqF0CqsnQJCrgsqVssjcfTgoZYUnP+ZyUfdbziZJCsNF0DoD+G/dt
         T1oiCKqnpufTdSLNnJUDejYCVtIyCnTBalpHgggX1UKf0oiZrfHoHoZXALdZtEX2DkwU
         OCbkNVN2o/F3JpR9j+S2wvPo2uMAtPgKz6xTd1/JwlzoIZunc/in8CtvkylmBKEQwaSP
         Ln7GEBrfuYQvitzGb1oe/LwnaVmAEY314F+DxZkAdl3+OmFQ9xpWrjHzskoTDqkYTtyX
         7pKw==
X-Forwarded-Encrypted: i=1; AKwUvBz9YVxJ3n52EauAiYCfJefgeljKXpd2zireNY//jeL5vK39LqtJw4Plpwtf34baXD38CS+0At9K7wM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z4BVToeaoYrmvx3gqNFutolEEpHX2/ZghGQVKJ7QBMz/RQ2ue
	sM3pWtCBDRfps19X0LSHi5UVjDkozCEdWNzL0whYyuJwWldX3DS8053Q
X-Gm-Gg: AYBFou0lXxXpkVEo4dKGgXMVPimnfByunu63ITlBLAw3Qp+bdu98GiHlK8EPXiuFHo2
	D77q9EPtjf3Ay+u0CKX8SB8cAV3AUv4Hf56ttP3DQqdfq5Sro2y9SLxiv5ZjJP7mpZPvU0M3WTY
	7WgNq/+d3ULxMJxdIu9q804HX86uowyT3l3Qh/HlC3iG1rot9UTzl3nCnHOheFAWjJBgaa+I4mT
	QSCO0LQ2QU6TGHMKHALJgzSnvrrHUnpW6wod+kN0iKqB6lkcTaBIzGXETXwOSx7F2naRXluM9BO
	RjjfpM2LTrzl/LHFCkLRliUyBMCRD2NiQj79AeiQlaX98LZZ2L9hC4rFjqMFNP9z9AIfJ/SnC08
	2pPHdVFGt6HXYzv5QSfgSGBDXCCM0WxCl+wh07bM6lXp/plpjtE9mXUeKQrVVoUiBvolnSZH8hr
	qoIGq/LJEez76Ma7zIdeg0q6rsRQm1uNtigvubauG/3gVBPZi5y2qqcs0zs9QnCxcOh1LQNyQSi
	cvXMjtLHfTSa3jC3nbRLWLrWZFhYGtVsYiStfVxLUBFlN4dt4YlDWkLPe5Pftf4p6cW87V9rV87
	hVTNeRvJhXfbiGsckPVGpp8/I20FKDbDwuigUWCPExgTpO1SkNQI3uFTwbc31XAOVVb/rrFTow=
	=
X-Received: by 2002:a05:600c:848c:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4ac17a3628emr323989335e9.14.1793732341420;
        Tue, 03 Nov 2026 10:59:01 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad5ff8sm252163205e9.4.2026.11.03.10.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:59:01 -0800 (PST)
Date: Tue, 3 Nov 2026 19:58:55 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <20261103.8eefa1e5092a@gnoack.org>
References: <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org>
 <20261027.4df00f962b98@gnoack.org>
 <auEa_2LQFAD023tR@devuan>
 <20261027.421170835581@gnoack.org>
 <auEr3XGMrHXiVZjs@devuan>
 <20261028.e5b1e67d24b5@gnoack.org>
 <auHs_2Ev5gQ55SnV@devuan>
 <20261031.f72558cbbbfe@gnoack.org>
 <auZcwYWv0NeiIR8d@google.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auZcwYWv0NeiIR8d@google.com>

Hello!

On Sat, Oct 31, 2026 at 09:30:34PM +0000, Kuniyuki Iwashima wrote:
> On Sat, 31 Oct 2026 22:06:56 +0100, Günther Noack wrote:
> > On Wed, Oct 28, 2026 at 01:45:11PM +0100, Alejandro Colomar wrote:
> > > > To sum it all up in a table: The only case where the null byte is
> > > > included in the buffer is in SELinux, when the generic SCM layer does
> > > > not need to do truncation:
> > > > 
> > > >                 normal case                truncation case
> > > >   --------------------------------------------------------------
> > > >   SELinux       has trailing null byte     no trailing null byte
> > > >   AppArmor      no trailing null byte      no trailing null byte
> > > >   Smack         no trailing null byte      no trailing null byte
> > > > 
> > > >   (other LSMs don't have the feature at all)
> > > 
> > > Thanks for the table!  This seems to me to be 3 bugs: one in AppArmor,
> > > the same one in Smack, and one in the upper layer which corrupts the
> > > string when truncating.  I wonder if we can do better in the truncation
> > > case, or if it's too late for that.
> > > 
> > > Would you mind CCing the maintainers of the upper layer in
> > > net/core/scm.c?
> > 
> > Adding Eric Dumazet, Paolo Abeni and Willem de Brujin.  (Kuniyuki
> > Iwashima is already in CC.)
> > 
> > Hello maintainers of NETWORKING [SOCKETS]! :)
> > 
> > We are unsure in this documentation review what
> > the intended format of payloads is which are returned by SCM_SECURITY:
> > They have previously been documented as zero-terminated strings (for
> > the SELinux case), but in the case of truncation and in the case of
> > the two other supported LSMs, there implementation does not return a
> > trailing zero byte.
> > 
> > Could you please confirm what the intended interface for SCM_SECURITY
> > is?  The two variants we have been discussing are:
> > 
> > Variant A:
> >   The returned payload is a byte buffer whose contents are defined by
> >   the respective LSM (and which are not necessarily zero-terminated).
> 
> +1, basically each scm data is binary.
> 
> I think it's just man page was not updated for other LSMs.

Thank you for the confirmation, Kuniyuki!

> >   Concrete wording proposal for this variant is in:
> >   https://lore.kernel.org/all/20261027.4df00f962b98@gnoack.org/
      ^ This

Alejandro, in this case, and to make some progress on this patch set,
I'll resend the patch set with the "binary buffer" variant that I
proposed in the other mail.  Let's discuss the wording there, if
needed.

–Günther
