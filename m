Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445AC2C11DF
	for <linux-man@vger.kernel.org>; Sun, 16 Aug 2026 12:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786882026; cv=none; b=ctYOxlPEMdUReee6az0w8LvlCAkoTtXX8bFeCZjF9uDa0fhdIZIC18trtm3us8rK6F6RdtSW5xeBMoVHM7lCLuGbDbXmk/UFRVBuv1N3G/GZh4QDGRAgo3fdy+7YQdbsfEpoRLTJ9Jqd+lqQDvvIzm/xXKZwVXSFvNZ3FrJSOD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786882026; c=relaxed/simple;
	bh=0dkEuo3oBzdmKgqGX/5XcotB+XB1kcS5WdEQQsP8ZlA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pQ584YJEtg36nqDL1ddCBr/u+7J1CUpcx/BncJqg0YQ7xI8UUrWgXWHbJQbnOBHZIy2pl1B+Av1Wf1iP6t6qt6DgDLahv/bOg6e9FoX6/jiRCcTZsfyg0t0RWKXmpefAzqAl/3jhrzDvYtQFGJD1TCEMfMdroyoKlQSU2iBsmjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4hNF7f45Zkz1sPSC;
	Sun, 16 Aug 2026 14:06:54 +0200 (CEST)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4hNF7X5Pswz1sPRy;
	Sun, 16 Aug 2026 14:06:48 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4hNF7X4KCxz1qqlY;
	Sun, 16 Aug 2026 14:06:48 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id iF0NVyk1VvWX; Sun, 16 Aug 2026 14:06:47 +0200 (CEST)
X-Auth-Info: 0MBwbcfYtg66M8JvXBv4UYZkC4oFxLgRouBZWlBPoRWJ5JvwDYfg7x9DVy56vZqM
Received: from igel.home (aftr-62-216-202-231.dynamic.mnet-online.de [62.216.202.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 16 Aug 2026 14:06:47 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 0CCB72C0B25; Sun, 16 Aug 2026 14:06:47 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Guillem Jover <guillem@debian.org>
Cc: linux-man@vger.kernel.org,  libc-alpha@sourceware.org,  Alejandro
 Colomar <alx@kernel.org>,  Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>
Subject: Re: On <asm/termbits.h> and <asm/termios.h> usage in man pages
In-Reply-To: <aoGk8FSBlwYAmvu8@thunder.hadrons.org>
References: <aoGk8FSBlwYAmvu8@thunder.hadrons.org>
Date: Sun, 16 Aug 2026 14:06:47 +0200
Message-ID: <87h5ku46co.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Aug 16 2026, Guillem Jover wrote:

> the <asm/*> headers are Linux specific,

As are the ioctls.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
