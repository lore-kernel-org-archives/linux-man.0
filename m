Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DAC30F7F3
	for <linux-man@vger.kernel.org>; Mon,  6 Apr 2026 05:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775453848; cv=none; b=qsznXibZFK0gg3q60YRph7ni1m2xjCcoDdZlKA1sW+DmbZkkyLmhGTxbg9FONaN/ivk3kzEkHRtE+EloRchQPOEo9YeNwYTxKyr/WodegIFHWLgeWGyAlTsCAZ5siE00z1LnQz1xkDNVOykIk/MPl2xYGe4x6VpFuHfDIKSL3M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775453848; c=relaxed/simple;
	bh=RBa2fwaGchH9Z85AB4rA2Z01I1WuNBf+p8cJA1Q/Ndw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 References:In-Reply-To; b=RrhmZyb93cMbUwsNBU8ViHkRuoqnvNwZUQyc89yiscGZWh+CzLv0QolqGwcYixIp3rqw8NnAfozNm73EIt0kd1EDA/zmO+6iuXV6uUx57Bl6/W90Ea0POQ1QEsimJL2/1qL+Pq/PXxYEotytCEQ2FNlgpaTc6AzRFQkSdain6Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vursc.org; spf=pass smtp.mailfrom=vursc.org; dkim=pass (2048-bit key) header.d=vursc.org header.i=@vursc.org header.b=f7/thDzI; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vursc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vursc.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vursc.org header.i=@vursc.org header.b="f7/thDzI"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fpyl63Zr8z9tQ4;
	Mon,  6 Apr 2026 07:37:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vursc.org; s=MBO0001;
	t=1775453842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RBa2fwaGchH9Z85AB4rA2Z01I1WuNBf+p8cJA1Q/Ndw=;
	b=f7/thDzIu8E517J6t5zF3Vc5D/TTwA34S7OROnh1yisGxlKxSZugxUV9qc8rqOP0CRi7Qd
	5fOyrz+WByEh12JEjoZj6IvHFVtiLPA/VsCbXCXdIDPxEYnLhsdM5lwFrJhRf11JYl3z1m
	hVma3xlipgndCV8riCp4cfnIyacf3t3YawfJQ2ONH8rWBwWSnI43Sj07BlmpmLInUyKyQ3
	lkaFT+YyfASPK82X02cLz2yOyzI7H1RnYGuwHdyvvKDl/tD18bFMSpgF3qcozGhv/wMSpn
	9fBWEDs5/o+2bnR03m0M2KiGG7vIfL8AReKZJXZmbvcIh9LjQ1V6/VKlxiEZ6g==
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 05:37:24 +0000
Message-Id: <DHLTV0BGLRPZ.3LJZ9TGV7U7YF@vursc.org>
From: "vursc" <vursc@vursc.org>
To: "Mark Harris" <mark.hsj@gmail.com>, "vursc" <vursc@vursc.org>,
 <linux-man@vger.kernel.org>
Subject: Re: [PATCH] man/man2/getdents.2: Fix incorrect argument type
References: <20260404074909.92900-1-vursc@vursc.org>
 <CAMdZqKGyG3vksBugjZ+WOt6xV7dqtc40L-vESmoAB9HZHfV7FQ@mail.gmail.com>
In-Reply-To: <CAMdZqKGyG3vksBugjZ+WOt6xV7dqtc40L-vESmoAB9HZHfV7FQ@mail.gmail.com>

Should I document the dirent64 structure in glibc? There are two
versions of struct dirent64 in glibc, in
glibc/sysdeps/unix/sysv/linux/bits/dirent.h and glibc/bits/dirent.h,
and the latter seems irrelevant on linux systems.

And I'm not sure about the wording. Feel free to reword it as you see
fit.

-vursc
