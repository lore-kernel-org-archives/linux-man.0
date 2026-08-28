Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6F7284690
	for <linux-man@vger.kernel.org>; Fri, 28 Aug 2026 16:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933479; cv=none; b=Pp3K3DlWuhKVsA15nflVG9SH8CuVCJMfCet+iH1JGrjanSn3tu6ZOa5Sd4DuCH6zzX+r1qj1pCLpHCk622qd/a/icMTpg+cJuzXCcw56QYbvb35PGyW6b0iLQQqJGVzKOP8v93uu8mi/oxbE+c+trKnIwPA3f8UMQ+CngyIXIZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933479; c=relaxed/simple;
	bh=efsef2R6fB/rbdWis5Z08Klv3201xMSlDHQdtKvuoKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A22SbB9ducaL5LLhUXCfW8sAhHXOU6X2mTon2L7fUMjfE2Bt79cSWFsIKG7wAx0UnL7L7nAFhMhhJYCTawkef03xmN6HnOXqgtkNkVXzWzgW6XqbUs0UWTnyBSs1MYaAMjmvD9gUFlqkXwt5dlmcrgw2Qj/v4uHYiQLscD+uTaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlqRHO8d; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlqRHO8d"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fecbb7000so419571f8f.2
        for <linux-man@vger.kernel.org>; Fri, 28 Aug 2026 09:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933476; x=1788538276; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QdUOolxw1mESLhrFibxyb7VuddwwMrp4H5qte4KcyLA=;
        b=UlqRHO8dshQhKgC38kBuMjfL92x2Rp4gAoIjnr0QKaFz9KCehk8J6AwwPAtc0WItMC
         F/MaC/MxxbF+P+5snHYNJlwzDVh1ouD3d1BsqENw9spKIMog9G2BIlyW9PL86f5H2iMp
         jCK6swrRZCsrP+A6fcxjVyB4l1h8ONF1AXncCJ1OajXGxo5wzTflaBn8/b2eJBAtQfh3
         umOkXNrdHbCGAtXhTWw5xBpplebyeNRFlQbAMwhrg2zdNvytFiEZRcsWocjfVf3Aw3Gs
         86EICaTPqLd2q/GeFWMBZXags8iVdEJGHZXGpMdOaIluGJmN+W7FGYiZw2CuoFea5O7u
         Hc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933476; x=1788538276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QdUOolxw1mESLhrFibxyb7VuddwwMrp4H5qte4KcyLA=;
        b=mASSXtPgNtR2U5qFiJQ/NZXi5YNl9UdW+RsOSBAYMbkr2r6cckx5PT5zLon0dWQArj
         qTx95oH0pwngwTBldUCpJnN8Vy8Z2mzRzOi0EK+Gs1GWrDiwmVGjTep8Fw0vWeBk7eVw
         t610WA2JcbMhnzLoevOXhpoAqSrh2qxwZ3nVEaqgFziYSdZSBf2++VjC0C4myr91ammE
         c+C/JDC4dBn8VgES7aU62FPGLUQr12oS31PaT08yiay57LXonE6GEPw7HW8T7ZvRGf82
         x7HglMRX8PZq3qi2JKnu1yDz9dy6/lRbo9MySRbW5uqDSN9RQD9qRElVrCrLENjjmTIN
         0G2A==
X-Gm-Message-State: AFuF++nJIKdOBqDXSd9viqH3rF00hOXyNN1xDZj+Uey6keRHjTlj3dTE
	LDJeg/CxV0iSjv5xuVldILbY4kyi/ebnvqeWF2WY4HryMxhfg0oAFWGH/IG829KT
X-Gm-Gg: AR+sD12+OaDDNeejK8Igpz5ERc3oojRLj+DKSPvUvtwotZm8Zn20GSvcafGesxYkRcj
	H3mT13HwmA00kQAvt8Yv40vyBm7o6SigP8U2ab4VIXlg7ZeS3QG51UgZ7HOetMAEn9mQA6H5hdL
	mR9RvfVCNd3TC/i4Adn1GXyU4Hdej85RRHKDn6SU4wH1TQMxKL5dNJ4p848UGU3auoCOquuyzPC
	Ip7dIOFngDxkEBV0vf6xfvTMm/T+1Kfx1xNiO2O3jpOhyFad7ZAaOQvS15I4pB5lIt1If59REbB
	Er/Aal+l29tpGXlHaC+zBC+xaUr4eg/fZ69KqJnCJRjk9lwIN4wW12CtCVuEJaTrBPpcul/usT1
	+CkFuTNi9tuN3G7mlbrY4p6VA2b7ei4wNZwyPsBUPzTVoqdnq54YpUBzwLKFZ2/Fb14SSxGo3o0
	diIOvcLlCJ9vhuSUjIJ6WJo/AP3Cv5CoXpwAuguaoEatdSVUBpYq58W21aqkVne+/U2QvXuPwxT
	ANddVcrYBHRXg==
X-Received: by 2002:a5d:5d0c:0:b0:482:d94e:f33b with SMTP id ffacd0b85a97d-482f782a855mr12585362f8f.0.1787933476196;
        Fri, 28 Aug 2026 09:11:16 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab730fsm5048968f8f.8.2026.08.28.09.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:11:15 -0700 (PDT)
Date: Fri, 28 Aug 2026 18:11:14 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/landlock.7: Document whiteout object
 peculiarities
Message-ID: <20260828.082d9ea2378f@gnoack.org>
References: <20260828160340.11238-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828160340.11238-2-gnoack3000@gmail.com>

Hello Alejandro!

On Fri, Aug 28, 2026 at 06:03:41PM +0200, Günther Noack wrote:
> Bring documentation for LANDLOCK_ACCESS_FS_MAKE_REG in line with the
> Landlock whiteout patch [1].
> 
> Link: [1] <https://lore.kernel.org/all/20260813093157.1436894-3-gnoack@google.com/>
> Link: [2] <https://github.com/landlock-lsm/linux/issues/66>

Small out of band remark: This patch was sent for Linux 7.3, but is
CC'd to stable@ (should get backported).

https://lore.kernel.org/all/20260828160340.11238-2-gnoack3000@gmail.com/

–Günther
