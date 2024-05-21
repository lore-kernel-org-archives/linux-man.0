Received: from alerce.blitiri.com.ar (alerce.blitiri.com.ar [49.12.208.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE2B763F9
	for <linux-man@vger.kernel.org>; Tue, 21 May 2024 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.208.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716288799; cv=none; b=u1j59N5ga7W3ZCevytcXs1wLkmYDZBgJf5d+eTnPcYM+x2/+OLz5xAGnO/vuUsljF0T8+KHnCt2Q5WciEVo1ojuk6v9Kdo/BHs0k4/dRmqJd/n5F42DR9wqSLy5+EaOA+AhWfg9isva/6Swe4IHvW2KzFrtBu9/eH6ttn8ztb6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716288799; c=relaxed/simple;
	bh=mCOV48s9chITTBUxd+ia1Esvt5YduneogxpsUgWgczw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BimUtKuS6fhCcrHdY5iJjs1Xuc+DJK926vEsBdXTSU7/mnlhtPotOtYjyQaeFQ4Eo0+mijdAlbSafzV6zhSVinNlsN4VbudgtluLkIEra7PwkBWnmcQqavmzyhkLR5i1+fjGKiMqKLGlXR08Ly2wQaz+yLcn4mjZb2DqKwzkCvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdfg.com.ar; spf=pass smtp.mailfrom=sdfg.com.ar; arc=none smtp.client-ip=49.12.208.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdfg.com.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdfg.com.ar
Received: from [IPV6:2a02:8109:aa26:4b00:1a1e:9a1e:44f7:a3cd]
	by sdfg.com.ar (chasquid) with ESMTPSA
	tls TLS_AES_128_GCM_SHA256
	(over submission+TLS, TLS-1.3, envelope from "rodrigo@sdfg.com.ar")
	; Tue, 21 May 2024 10:53:11 +0000
Message-ID: <cb13f9fa-495f-4698-b3fc-f26388598e2f@sdfg.com.ar>
Date: Tue, 21 May 2024 12:53:10 +0200
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mount_setattr.2: Update supported file-systems
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
References: <20240409141046.124979-1-rodrigo@sdfg.com.ar>
 <Zh-6YjDhSBUNKmqP@debian> <b52c03a3-bc07-4358-aec4-9728f213d31e@sdfg.com.ar>
 <Zi93EAyeU4byltGB@debian> <60e07e4b-3cbf-497b-aecf-bd482bb4974f@sdfg.com.ar>
 <yjpaqj7tekvhazxklqnpxknwy5lyg7yp6m5cedbtiwks3ioxsb@ive3dxu6vqoc>
Content-Language: en-US
From: Rodrigo Campos <rodrigo@sdfg.com.ar>
In-Reply-To: <yjpaqj7tekvhazxklqnpxknwy5lyg7yp6m5cedbtiwks3ioxsb@ive3dxu6vqoc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/24 12:31 PM, Alejandro Colomar wrote:
> On Tue, May 21, 2024 at 11:08:58AM GMT, Rodrigo Campos wrote:
>> There is no online html version of this, right? Not even after the recent
>> 6.8 release?
> 
> Yes, there is.  We publish a PDF book for each release at:
> <https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/book/>
> <https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/book/man-pages-6.8.pdf>
> 
> with a copy also available at my own server:
> <https://www.alejandro-colomar.es/share/dist/man-pages/6/6.8/man-pages-6.8.pdf>
> 
> And if you want to check an online version of git HEAD (like this case,
> since the patch was applied after the release), it's available in my own
> sever:

Nah, the patch was included in 6.8 :)

> <https://www.alejandro-colomar.es/share/dist/man-pages/git/HEAD/man-pages-HEAD.pdf>
> 
> You will find that my SSL cert is self-signed.  It's documented here:
> <https://www.alejandro-colomar.es/ssl>.  You can use HTTP links to avoid
> it, or add my certificate to your browser exceptions.

Oh, thanks. Pointing to a specific release is not very useful for 
documentation, as I want it to point to the latest version so users can 
see which fs support idmap mounts on which kernels, I don't want to 
update the link every time there is a man-pages release.

Also, in 2024 pointing to a site with self-signed cert is not something 
I'm not willing to do in the Kubernetes documentation. I understand your 
issues with CA, but self-signed for this context is definitely not better.

And don't worry, if a CA does indeed impersonate you, no one will 
realize it as the cert will just be trusted. Maybe only users that 
remember you use self signed might suspect, but maybe they will think 
you use a signed cert already ;)

Thanks a lot anyways!
Rodrigo
