Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606211;
	b=3x4mfgkOfurkdcgT1Aa6kRmTbC3OiWNDELWXD5cI2FQw7Ke5j0xOeKZyrW4tfDS+UqRM
	 7u4e5x2DlmeSPpuxE83fmkMRdkHNOtyWDdZvOiiz6I3fqCOrDdTR5XyS3yHli7jqV0TRn
	 sH+sezitBgRvqp4mmHG2yhFl43t2wB5nuVbloKWBdAJbdpE7ZJY1oUir24HQFuDjLMlq3
	 40tl01Ds10YVu438KKddeD1Td+nl2/5MrtU/PPxK/gHuzTSHdMLPEZKCidcT2+9G6SEbc
	 tfLL+hUDyKu2olVhct9aRJmGdemtYCm8Ha5QZ1cfH/WwAp+j5PZEnanqGnrkddM7zuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606211;
	h=DMARC-Filter:Received:Received:Date:Message-Id:To:Cc:Subject:From:
	 In-Reply-To:References:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=T9bsHPgc921dVPChpkkTnFZp+b7+uaRABe8N0qR4F4M=;
	b=0TINu9zWEJ1AimkaPAW5CxvgE+3DPOaVaXOHArZlIe6VCih9XsClIvrD0yEL5IGcOYRE
	 PoZTymRXMYHZFF6A7Ssf4JafY8lFP7Qq/e/YLGHkus0OXg5zIBttBJcNHnD5UaXQJdEj4
	 s39seuai2bj2V/wDMPO5CIRIJxAE5EsxAUv3NYKWFgpg+QZkFKCTXsdAdBYlxIav1BHVi
	 dIdiReDGr+BogF/mdblvOKco77DCFANtLWtT19JKo9fVIlR3rsS7uwoXHOKb+1ss+N4tb
	 TmOz4sLVV6y7i1myT5eRoZPdYA+PcBiTUzes/e7X6vUmeNC64KtlsmW2huytoHx72vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gnu.org;
	spf=pass smtp.mailfrom=posteo.de;
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0EC606A31B
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 18:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B0EC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gnu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 2DB3A240103
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 20:10:08 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4j8y4H4jt5z6v2k;
	Wed, 21 Oct 2026 20:10:07 +0200 (CEST)
Date: Wed, 21 Oct 2026 18:10:07 +0000
Message-Id: <20261021.201003.747712524877439210.wl@gnu.org>
To: alx@kernel.org
Cc: linux-man@vger.kernel.org
Subject: Re: fix for ascii.7
From: Werner LEMBERG <wl@gnu.org>
In-Reply-To: <atj9VY3mMbOac1v9@debian>
References: <20261014.092406.765912014587965340.wl@gnu.org>
	<atj9VY3mMbOac1v9@debian>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

> Thanks!  I've transformed this into a git patch, and applied it.

Thanks, too.


    Werner
