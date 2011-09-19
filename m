From: Sunil Mushran <sunil.mushran@oracle.com>
Subject: Re: Man page doc for SEEK_DATA/SEEK_HOLE
Date: Mon, 19 Sep 2011 11:57:48 -0700
Message-ID: <4E7790AC.6000801@oracle.com>
References: <CAKgNAkhZSb0UfZz7N+gKRQD0r7gnC_3-VCB_ORio8ojczbCDvQ@mail.gmail.com> <4E77827C.3030202@redhat.com> <4E7789A1.4080501@oracle.com> <4E778D77.4070207@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <4E778D77.4070207@redhat.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Eric Blake <eblake@redhat.com>
Cc: mtk.manpages@gmail.com, Josef Bacik <josef@redhat.com>, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On 09/19/2011 11:44 AM, Eric Blake wrote:
> I guess it should instead read:
>
> EINVAL whence is not valid (this error may be returned if whence is SEEK_DATA or SEEK_HOLE but the kernel does not support the operation).

Sure. Maybe add the kernel version. Support has been added in 3.1.
