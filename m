Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792468095;
	b=TeBfpbfpShie9U08UBEWKelWtRV87o4QVFTjb/hb6lsQ7acNLzX9OCQ9Cugq+rraHjmL
	 tOwQaalToXUTXqs2Er8WdzhFVBdT76/X/tc4avQYwODNopXxzdbtu8PxsjKJ/8oOsWnY1
	 ot+yWhN1OVmBBKYVa2plbx+ufMv0u4m93H+c+ksM+qQGEoBPjyhjj9HWstW4AWNuyOHjC
	 FknM79Ds7hNdDB15U4Ekis66rP1+pc+brg0O8RzPa/ZImuRz8W5puzfpY3ceRYq4b+/WA
	 gGt1iV0nZ7KQx1zcV12PavnaiT0kmKWodVMgLe8pI7X4g6HzaEhARcs6SW2h6twx3yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792468095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ITL28FetUolc77JEtOQROuHlrYzKvFev2ONWojeouCk=;
	b=2LQEFg5mIJDMg4KLd1urwicGkFwAHyZm6WdApJ6TPvScSbA2UP3FjOYBXRHnuHfdUFEx
	 knzRsk5DYw5LkxT3XQMrbOgLTdTO61w9tbw4U4SKL9EDjxa3CS27QJyp3eeEomU9QbEdq
	 3hq6azG9BrW+pN4bS7lxa9Ds1Z76sSEI8BHTK/jNJO4AAQuKvjSu+m+1xcgT681epFGs/
	 8y21nNVaaAvHMAxDRq3CfL86jtyc3JLEeJrus8uMtkG6EDYt6RUQmddYj/ycD7+BZ69TE
	 RX4IYITNBg/6gwQAhefWlIr1MGHDf3hd96dC7TrRbcmFri1Au8vTTJVFVqhH/zWVqag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rkxfZRWY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702AC606A31D
	for <linux-man@vger.kernel.org>; Tue, 20 Oct 2026 03:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 702AC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rkxfZRWY
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so4934305eec.1
        for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 20:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792468094; cv=none;
        d=google.com; s=arc-20260327;
        b=kuVP3qKYPThkcyQcqRQT82exbQU4HAkyGOX6Bb9q2EazW0G5Dg8+JhXxrJ2NJ42C1+
         PHJ9OVlHLyVAISQq4glfv51KQNH5sHRJ652Z2fjdHpL1aHTFHG5vSiXhuXT6or7yKfC5
         L2X1V11VD1A8KGCYEdRm0BV3wApPLt/HTMBXtje5XKwPskmzcc3Yst/VzbvzELdahJCx
         U1L5CvWnfIsTskXZ0rUNNTgZbGlMA+UW+aGZinIjTcTBOeK+FHGi7ZNd6iqBjpgOq3E6
         n8atkg3eURFaFFaAZ6UgXE0Kb1QyckeASBZFKF508Z9g/kVTq0yYQrENqno6XCbzfXuT
         6z4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITL28FetUolc77JEtOQROuHlrYzKvFev2ONWojeouCk=;
        fh=Qf+bnYUkesDVMtsx+JCrZlbXKUwPx5XPNxUNbypE7ss=;
        b=F1Kqdx05hKYNAeGZIbGvkNDiYNh1NZTmW7YAGZ+7Ws7OYbgV16I9L27VCulPxanGf7
         DPU1SqV4uE3u2T1yl9mtqMCX7Uy2HxcFfonuvdOXKOC1le9T3+yXvZgQu2WHNWU45R2T
         +aiKWa7Nz42obA0l1/WWO9Kd5+mb7RYcqqmzA/exBn29o3eQXgSrF6XP2aIa5g7hVwzo
         cHyF+sb+NET8iOb92YWBeiuZ+GlUiZ+9PVbEbLN3Ou7D0CU8gjSPM4EYzMrJYzS83+A1
         CyqO0OoO8fzD+0r9rRJb1A0ZUVgxFGgXZ2aAq2rhe/Kgfu8GFq6JxhFNChLNacuBGL4J
         Awfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792468094; x=1793072894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITL28FetUolc77JEtOQROuHlrYzKvFev2ONWojeouCk=;
        b=rkxfZRWYQm5jrgpBcxkMxJX/1bxx9l+x53P9Wr8gvXBybn0EM51EEEOx9Ms41YLvTF
         wxKuv0xV1CbUAB9d66dZ+Ly7jF/qon4OFDdoPBmcOJKFBvcUTMsHy5miW/akhc1haLdr
         /BzaaAXTVAwbuIJB+bmk7he/8NkIAUlezWwSDMmLIctBBZdO1JH8r0bbgVn2zTp3X8Ur
         9yzf2iYPL0fUdqkDtyobCfmvl/Wu4LN4LfWUSctWCHd74sapOqU1qH9nyylClZFc2KWk
         Kbm8KPoLRgv3X4vOv6cSyctNrGsPUW+L09WDf6XkEyE7dOhM8B5yS41z1msXl0dcArq3
         qEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792468094; x=1793072894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITL28FetUolc77JEtOQROuHlrYzKvFev2ONWojeouCk=;
        b=vXKWPpmWUXVlF/EptzllK0QQHUQP7enhgQK2T+jkoKXY3x9f7PwP9TmtMrIyApBwbG
         HMKrcLdiT0Dh2dKrGahXoLeCMGqs7yyrSPMRGHSh8NOK9PD0+evzhEO6i4gdV+Q9gfvZ
         b5iM9ei5z1rzdkELk0XYH7vZaYEbWBH6ajeAK/1HBpbw/mNW9dZ13/hS1H4jNLOg+2zQ
         lxp29o96cZGJ86zwREUwYqzI5xPFZHzyMoZRY9Y72cDhOgx6ZS3jsif+znrbKqfZJGeU
         hE68HTVV1F7Ei9D/8TfPRJ74PunqXvwnpGiNVq2B+OL0yXxCxDv3imzhZD3fu6096j+z
         YT3Q==
X-Forwarded-Encrypted: i=1; AKwUvByxXWmYp0EJqw6Xofg5uvxY6ZkIEBm60Btc3ZXctGUNs4n+FhyVpp5c4gS/NwQFEGEHcdB9YpdtL3Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb0pLxcKinARJEOfI1EnKsHq5JxoYDPaW3Ehi+MExMfo68ZPrL
	YCirgVncbg4udr7jqtbaLlVrKhjYRwdwALnGQoQU/CCLqt4Nkk1eVg+u4xEYHqcGR9uWlYB8804
	9WVqH0Rr+NDKk2/F6Ce0CiyzFZ8SoVbtYQ4gOB1gO
X-Gm-Gg: AYBFou2NxyTIgLgS/pjYD/VccHH4CYxhSx3dH0FF6BH60ZlNXLc7ctSELb/q9rOzia7
	zJll8j9N4kufvnTVNlZifGdeUpVN8D79NrFJcgB33an9768wFGFW0bRx78fpKW4N623wIwX9Ads
	Y1jBZgeSyO4CYDNCA7sEleLvGUZfrP7LUf6jxWnAQQz63WPmTfzNkv3/q50I6ABK1DGIy0Hk0Gm
	IrgZ5WPemuLN8V03NEhXxAKeRkrHMz8uwKsAT+TAE93hsp5zgsLrn8efvNotbUAGbTYBA0ZZleS
	j3O0PnIKnMwAr5fyXmY6d60ksdwsYBBgaHFfluI0lc5YkLXaxDzvYo09QYzWk1/h3jDAMyxmaJ9
	LBaXw8dnHPxNh9CZqLmQV9DSK7xYunlVsaZ/IaF8riInUeHWkpawgzzyfztVFF3fg1qH9nEgPT4
	Cjhq/5Sc0VZ8nwYzLHv1rRruUv
X-Received: by 2002:a05:701b:4641:b0:184:5f2e:aa52 with SMTP id
 a92af1059eb24-1851238b3f3mr12673469c88.16.1792468093474; Mon, 19 Oct 2026
 20:48:13 -0700 (PDT)
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018173712.27670-1-gnoack3000@gmail.com> <CAAVpQUCYaDWSeQormOH9SnJeiDnLanxvADGQ5WU7OkFN_zGzqA@mail.gmail.com>
 <atW_3kqU7KMcxHXp@debian> <20261019120722.uuwnzo25ovuazkjz@illithid>
In-Reply-To: <20261019120722.uuwnzo25ovuazkjz@illithid>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 19 Oct 2026 20:48:01 -0700
X-Gm-Features: AclHuK93YZ7HTpugUPXDc7ZQNnT70FKjmycSZR5WUn2sOqpiJk4iF2xUWYqT7Ao
Message-ID: <CAAVpQUAvmw2SfcQG84SohczjjkGS1kHOkX1=dgGDTHCaS71tqA@mail.gmail.com>
Subject: Re: the meaning of "ffix" (was: [PATCH v2 00/24] Documentation fixes
 in unix(7))
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>, 
	linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:07=E2=80=AFAM G. Branden Robinson
<g.branden.robinson@gmail.com> wrote:
>
> At 2026-10-19T09:05:21+0200, Alejandro Colomar wrote:
> > > Date: 2026-10-18 11:37:16-0700
> > > From: Kuniyuki Iwashima <kuniyu@google.com>
> > > >   man/man7/unix.7: SO_PASSCRED: ffix
> > >
> > > ??  This reminds me of Final Fantasy IX :p
> > >
> > > Please fix all of them.
> >
> > We use 'ffix' as a shorthand for 'formatting fix'.  Those patches
> > usually make something bold, or remove bold, but don't do anything
> > meaningful to the page.
>
> Also see man-pages CONTRIBUTING.d/patches/subject:
>
>     Trivial subject
>         For trivial patches, you can use subject tags:
>
>                 ffix    Formatting fix.
>                 tfix    Typo fix.
>                 wfix    Minor wording fix.
>                 srcfix  Change to manual page source that doesn't affect
>                         the output.

Good to know these, thanks for the pointer !


>
>         Example:
>
>                 [PATCH v1] tcp.7: tfix
>
> Regards,
> Branden
