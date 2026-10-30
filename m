Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388281;
	b=Z85xtjTXkjpjv97TEIW7tmUcDrPQpGDE2rE5e9H6W/WL+DcaNV1crHPyZWNilyZOtPvX
	 WSfpjvKui15h17k04lFMPzU0KAILn43hd5rhDn4/LpeqiwZ455HI2xPsxQ9ugOY9D+3Aq
	 vw81iaobcap+IBL6VW9SbmYejmbqpFDQfSx7if9kwsgkfpgvhAareTJJs4ArGB6LXmn3H
	 5FTFY3DIkmXvhgb5RD6v2yeeSTcQiKRdtmLwwDKas5zuI4/2KYFl6AcRrGFCKwVyGFZQ7
	 ez/Vf5ad0uFPK7DEFo9UgHG9AT/G/oM9z4L45YnWwLatwD+rXb/mofVH7p6GaRqVuMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=6kTPVE/Rd/P3+/RZkdjdUkdrgOGCsrf3uEvF28og59c=;
	b=PZoTeVlm10swTcjU5vL5HDKrFE4EezCwjnOIOEDlQpg/hS/Xwu4DDWfN75pYEBDFgRVX
	 y8HCCsR/8rGs0Zta9nx+gqMklOFsx7MaCE73THV1QJT4s9JyHSvBH4kVktVRgcFXRy4qs
	 UXVw+IRCeDDFauaUfE++aSQS8sthisnK0Vo7D9fdUa8K1zcaicrFtKJtqEnQn1RRajWja
	 D0n8EaGSNH3NkUrUzyMPlX/3tR34CS1RR7Np+kksP+Kv7YixmgVXBWoLzfWyjSyHorBEr
	 dfhsv63YNuGiOsu/sBEC7TCwU3v5d4mfFHyu2ho/pZ/ns2z8se7/3uSIq163Qab9hZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTxIxpeC;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8678606A323
	for <linux-man@vger.kernel.org>; Fri, 30 Oct 2026 19:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8678606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTxIxpeC
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so926119f8f.1
        for <linux-man@vger.kernel.org>; Fri, 30 Oct 2026 12:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793388279; x=1793993079; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6kTPVE/Rd/P3+/RZkdjdUkdrgOGCsrf3uEvF28og59c=;
        b=fTxIxpeC3h479pCGUeYtaT4o4ysvUhl9V0mWukSLBS0/0FAnLPX71wAXPXx7hSZ0hK
         SpGCoZlqPZt6Uyh/pxoXxt9se5hCqjYT/fwVAUa92uEJOkbd6KDGMx9hZjpiUriZy7oB
         G9uEhQ08VwLGOdgv1PGGarpaUODOoMaTdBfFNhvlMDZV6A08udyUpBlENAo37P4GTN3n
         ucCOpaknnMGxEa4gyesi3dNNaR5arjQTAYQrnuxjT7JVYw5rVuqKIQ9YaySpa2tVEJTe
         3+jVRzenOBIkgWi4I+bkO6v+k+taU3pSU9uo+ro7c3zk21sPTlExznlHqqUdjs48tsrg
         Rl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793388279; x=1793993079;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6kTPVE/Rd/P3+/RZkdjdUkdrgOGCsrf3uEvF28og59c=;
        b=hByUlnkOhQzbG8ak63r4jjlDCyrdqipKE/Qp/0AGt8McPUrtLHv+qIMYSiiBskuoeD
         D3Tv6SWhpPRvAoFN4BoJpKDq46Z8v19qFuARqJdyOqBgy0/l9LUW9FaWG0b+Gmw1RKJj
         4RazHSsivyJJe77lYGOVt3p5nbRg532cKsBnC6ORuVyWcJ25Iu/BCzbWlh5AHHMbS8LM
         vEBYvhJLuEcJ4Rx8lK7ppa86lP2sMshJSIXDGYv1oy/mLOhTPL01ieDP17doytsuDxqy
         1Uoa/Dz1j9CmmrsXIfm20IjOY8ADVli0sZGU4Xhtjvqz+BPGNt0dSxctTgv7VPdnz3yp
         TDRA==
X-Forwarded-Encrypted: i=1; AKwUvBz5AH8CAPUcLmCnftwwzeNxGCtR54B0bMZY9BkyjDAsnnuPLHkvOw0UyspC/7Q+LkZqk9DcTKgrfDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKcU2esFclhrclD+OAJP4VryIWFjY3eXbIcmtbpgTgR/KMJxQR
	hW5vVVXUVL9GBg8seGhW2D9TYMdfZiVIpk7jc5Kz4DNcecoWb4Y1dMJH
X-Gm-Gg: AYBFou0vCCYNGCsJ/nHhA22PMRfAKxknQAj/dJlcPWB0wtHqGvbAyPib7Sd5pkho2il
	QgBUinYJd/Zcm8g0uBfiHuGd2en7kCtXx8hPiTOJNSIFH361uqyaBzFwiYObUKzQvh+5rODoFv3
	nM05v+gRbtvN887TzXVtGK4PBoeSYFN3Z1sZ6YfcmlJK5lWE2TA7wus8Nl4dj1CZczbYB2/xIVY
	P0Fyw8W0aiIp6swupSvFDRgcriE1Jd/rl52dIR5RT6s+lQ9nXjrsQPO8ETj4dwyIWOXcz/2t5yU
	9AlRBmRvsUhuFwxJrFa8Zry831b1NidzA9CHxbRL1gSTPCVehQwV2G2i7T8M/VR1NuyYNpfPdR5
	VXnqePdbt8ZpIP1Nvrt+2ZPWdgikcyStcKOgXdjkKMrhmlrsxhPY1LrGjBYI8Aui+ya82+GM7fd
	AfUfyha7da+zygxk0xMNwP0jahrawNuvSsWjyZIo4LbymLOGrt/KAKUtkywgbgvS74KB6bPWEuy
	X/Oy7w/4svkC+fI/+OqZGcKVkO0WKzNXh46BK/hzwyazIC0NMG/xJTVcoUF/BCtvoXScHkhwQ0K
	H57LCSv/tlfI6ejsO9C0TA+47Zp65vm0vd6KctrPFyYJm0e4YTsCJw==
X-Received: by 2002:a05:6000:2dc4:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-48e6e535ca9mr7842846f8f.56.1793388278841;
        Fri, 30 Oct 2026 12:24:38 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm4560126f8f.51.2026.10.30.12.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:24:38 -0700 (PDT)
Date: Fri, 30 Oct 2026 20:24:33 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Matthieu Buffet <matthieu@buffet.re>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH 0/3] Add Landlock UDP support documentation
Message-ID: <20261030.5b8905e593ff@gnoack.org>
References: <20260917075853.10231-1-matthieu@buffet.re>
 <20260929.phoohohs5Hoo@digikod.net>
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
In-Reply-To: <20260929.phoohohs5Hoo@digikod.net>

On Tue, Sep 29, 2026 at 09:02:34PM +0200, Mickaël Salaün wrote:
> On Thu, Sep 17, 2026 at 09:58:49AM +0200, Matthieu Buffet wrote:
> > Hi Alejandro, Mickaël, Günther,
> > 
> > Here is a small update to landlock.7 and landlock_add_rule.2 to add
> > missing TCP info, and add UDP specifics introduced in kernels 7.2+.
> > With the benefit of hindsight, re-reading UAPI header changes, I
> > actually did a bit more than copy-pasting from them (see patch 3/3):
> > - explicitly state in the access right description that sending
> >   datagrams without a destination does not require any access right
> > - more importantly: clarify the description of the most non-trivial
> >   behaviour (auto-bind denials when emitting, which can occur even if
> >   CONNECT_SEND_UDP is not handled)
> 
> Thanks for the patches!

Hello Matthieu!

Friendly ping on this, to make sure we don't forget it -- do you think
you could find the time to send a small follow-up to this?

Thanks,
–Günther
