Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5160623D28C
	for <linux-man@vger.kernel.org>; Sat, 15 Aug 2026 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786804546; cv=pass; b=nPASW1xdnxwrN3ly+eiUm9ZU6FhqD9gKCoBpJ7oRTbR7GhpohT0RDhxF/gyPteO8gk4mlZpMK/QCbj3uxu5I3rp0sxI0saBeAjtmBbW6eJgCBMq76xIvGcoYsb8lIaAaQQOESUuIlPPhS0ilT1YwSw/h2lWLXZmkzBBkfpHYuVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786804546; c=relaxed/simple;
	bh=+zy0eNxjPmilpbj9a18eoyNB54w6GAFjYYkKwX4sKFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIVmbrYiLk3lBUYkb/ltVdVdxKVh0k/HRxRVitXycPvqEObbCelRRhwNKx/q5x4Ct02z+VhWH/E2DNsL2Q6d+wpVk0SrewmAhnxV7Gv1HXpX2FclIrbjpNrFNTz7k/bclom/K8KnMpLet4SBbEbTSWE0yRBLmhqhXRQpwPDz4W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dartmouth.edu; spf=pass smtp.mailfrom=dartmouth.edu; dkim=pass (2048-bit key) header.d=dartmouth.edu header.i=@dartmouth.edu header.b=W5mTnaWI; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dartmouth.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dartmouth.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dartmouth.edu header.i=@dartmouth.edu header.b="W5mTnaWI"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aec201b582so1912417e87.1
        for <linux-man@vger.kernel.org>; Sat, 15 Aug 2026 07:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786804543; cv=none;
        d=google.com; s=arc-20260327;
        b=FFWfOWqewdfQKw5zQRMu9GA7dAsaFQUWH/EfttKkRzpJGRofY+jZWuaybJ/rs8HqiU
         qnTgjh/3cTSowV0lQGO4sILFcff5dhrM2umb9cUaFa9nX7aGD3tgGW0Iy22+Ba6C8CTU
         bUIHhs0pfIWY11AI+H9fsyeTOh3ewyNSRTpckQyax4DD3BZF19Vr1DyhxXE3s5uZAv1N
         dvCluPINVs+zJ9iMFlYi/1KmS01tbUV398Db/CslHL5qHJb7KdFVye7ffrg7b1uj42ql
         Ho3TY2vtZv7KtKyIV6x+NkiPyyXxu65z9Nm5sUyETkFjccdtZRaAtKPkQMq/0PfmCli3
         Nbhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+zy0eNxjPmilpbj9a18eoyNB54w6GAFjYYkKwX4sKFA=;
        fh=BAHhdoNKjP2rU18x7b3pbB+tNTEfl9T+ZaUlSwzDRgY=;
        b=HDaq56OIsVh+toe05PNxYJdcuTVBgWHFRasVk6KfoUDYUaqb/IdVo5G7x0dIPAKKQr
         /GAzj6ZqNet/eGjdWmwO6f5LpucL+dtlly/pS+LaOJsd1p3O8qeOg4OI0sGKvj9USb5Q
         vk3daA9Wsg1ILFW1uCVuUUwdvCMDmWF0hqGBH6DFsIc1vz02mUSix7K9QaGBwEaVHYi2
         qXQ/T2Yi6ruipBBWX0L2UV0zerWStbmOYhs1WruJv1Srv5fTWC8J/wTV/UKlWOuT3A09
         xkwsS61H4h9VzyLwFbtF/yiOIsO1w2/JzxLG99Ji9Ou2mto50v+GxzrgR9sITkRbBE6f
         I+Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dartmouth.edu; s=google1; t=1786804543; x=1787409343; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+zy0eNxjPmilpbj9a18eoyNB54w6GAFjYYkKwX4sKFA=;
        b=W5mTnaWIuO0KLQfZlsITRpeQz8ldJcK0h3l5aXrFdnirqbFr248Hu8Jc0J7oV2FKgW
         JeE9cs6IYqsswfYPFiKBm8FppELF+wjyBY/tM8youcfbPjb6QSIu/WALtv6nuovU0esA
         wlpBdLhWvgpphmTq6JcDhRpR8m7pcbIOkVWlMdrpsLhsb5NYbmlRbG87Be6JLrOKY447
         45wW3HDpt3GUUWFc9BTNvCBVsi5db7dA9JZgPmQohq03qHQiC7i3dYSRspEfC9D7bOnL
         WGrHjb1WQw88KvhCyGNsnQuA8WTkvL4wq92sgXEQlKvEMJPynihLW9IxsxpS42SbH+U+
         1CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786804543; x=1787409343;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+zy0eNxjPmilpbj9a18eoyNB54w6GAFjYYkKwX4sKFA=;
        b=UeQ9U8o/boG6+mwCHr7b+B7Fhtd9l9yOU7RimszDlZ4HKDmQTe6avBCApHb4NQSA6D
         a88v4xKF7B1jZfYNxwV8BVOiU+66R639YOXPtbIIz9SV+QGYOPnmgmrd9ud1Pv409LWM
         FG6LWRj0NSEyW2Tx+FsCTLDZBufVI1uMxTSMTQmu28pvbno06nPo6TgHleSTzK3e6RHz
         f+7cZDqBFd99l7oz08cKJFXH+tf1KiDoo2zvlcQzacsR8/LLdYWO2DYaD9w9Fu0J9pl2
         BKx4nxZkackRh0hk6y8Dbc1vPAfWuzqr6OCdvpZvMPuDSlca4Eu9EmWBbCKrno9w6tLt
         ANKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqwq5TezpmnBtCXjjYvtCzSe3jVG5eV+JtpQrUbQXAmOLVtHEz3XyQ2zSNX3jgu7ixLeWYa1k863Ek=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfgKrbxVyS2wn+3Vz9CMp8H5mv+orKJ2p3lz/ymh9KEDPFR42m
	IZ6CWKoLbBSKdL0P4TjIBT4lqIrJU6ktCRSr/R+yYC8dgBDLO45NPBI9rrkjx0aBI4h3d2G4+hH
	tU6L1RHO+xDg1Ly/4g6ah/zlpRJbU4ZRoHthYVAN9BwcOQZiBBhnqxDU=
X-Gm-Gg: AR+sD110afwNodsbdKM90cKc8G+6KOdTEQ5CqevV5PbsOGmTkkE11Owf/dUb5wolumH
	Gwlqn3VTawXQZeK6kwVoXNKbhGyNfBYnt43w7awTGJkpyZG5SOK366Pmc3aJTS6BSqk7g9BnhL+
	wGwbUfGhtXaxY+ByKHWKGyrryEJLX4S+CcSQXfBJfUXd1rUMz0CXE1rlUkWN/yHXG1K0upLResr
	IgutjhPhNRLI2J8cIgmDPwqMjgy2nlNBEMc2bfkcWGvPHrmKaxBEkyYdJLcJsTcSmEY1tAN3zTE
	AlumV/9UWBpSOsz6LjpF6guHbX9Su9Vfv6u2Imu/j26GegfnLk0niEjSW+VHPXwP9/c1xpK6yoh
	byPsW29pATAuIiV3tOi6wpY0FIseU+fRZJRd2CdMy8pfR+SZ6nVXKMOfHgY/pIT1qXQxbdS6Bp5
	qHvvuoqJ9nAVs9av0vW/6+7hK4Yc5z5Ux7t3GO
X-Received: by 2002:ac2:4f13:0:b0:5b0:1eb2:53de with SMTP id
 2adb3069b0e04-5b45918b14amr2141121e87.44.1786804543509; Sat, 15 Aug 2026
 07:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <am56ZBzNM5J07AUa@devuan> <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan> <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan> <87cxw1s58a.fsf@gmail.com> <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk> <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me> <20260802231058.o7gud4bd7co2nbhv@illithid>
 <alpine.DEB.2.21.2608140556070.14132@angie.orcam.me.uk> <11bb78f1-09d3-4e90-a4ab-1de76db086e1@tuxoid.at>
 <alpine.DEB.2.21.2608151339430.14132@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2608151339430.14132@angie.orcam.me.uk>
From: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Date: Sat, 15 Aug 2026 10:35:27 -0400
X-Gm-Features: AcwNN1VS2Te0593mzqJ10ZY1ksuj-TeH9pCfxgRzEJUAMLzEGRvdD7nVvTurOho
Message-ID: <CAKH6PiVMOO2pj5Aod1e7NAT9mAT0YuwFyUP1BCcUC_hE4M53Ow@mail.gmail.com>
Subject: Re: the Linux man-pages as an educational tool
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Bernd Petrovitsch <bernd@tuxoid.at>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	=?UTF-8?Q?Arsen_Arsenovi=C4=87?= <arsen@aarsen.me>, 
	Alejandro Colomar <alx@kernel.org>, Collin Funk <collin.funk1@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Content-Type: text/plain; charset="UTF-8"

In the limit one could have a single header file for the entire gamut
of the C standard and one for Posix. Who can recite even a tiny
fraction of all the functions and constants in those sources? Such fat
headers overstuff the namespace, making it all too easy to step on
accidentally. As a rule of thumb, I'd say a header with a hundred
entries stresses the limits.

I don't put much store by arguments about the effect on compilation speed.

Doug
