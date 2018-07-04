From: Walter Harms <wharms@bfs.de>
Subject: Re: [tz] "time zone" vs "timezone" in documentation
Date: Wed, 4 Jul 2018 09:35:03 +0200 (CEST)
Message-ID: <1372798594.84631.1530689704630@ox-groupware.bfs.de>
References: <20180619013049.4097-1-eggert@cs.ucla.edu>
 <9838498d-0dc2-b51f-08af-fb447196cce5@gmail.com>
 <26ec9696-f120-15e7-9d9f-9a66eefce9a0@cs.ucla.edu>
 <2892e775-1503-ac52-4401-785bef9b1284@cs.ucla.edu>
 <c79ebe96-ee49-5805-28bf-bdeab61930b1@cs.ucla.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <tz-bounces@iana.org>
In-Reply-To: <c79ebe96-ee49-5805-28bf-bdeab61930b1@cs.ucla.edu>
List-Unsubscribe: <https://mm.icann.org/mailman/options/tz>,
 <mailto:tz-request@iana.org?subject=unsubscribe>
List-Archive: <http://mm.icann.org/pipermail/tz/>
List-Post: <mailto:tz@iana.org>
List-Help: <mailto:tz-request@iana.org?subject=help>
List-Subscribe: <https://mm.icann.org/mailman/listinfo/tz>,
 <mailto:tz-request@iana.org?subject=subscribe>
Errors-To: tz-bounces@iana.org
Sender: "tz" <tz-bounces@iana.org>
To: Paul Eggert <eggert@cs.ucla.edu>
Cc: linux-man@vger.kernel.org, Time Zone Mailing List <tz@iana.org>
List-Id: linux-man@vger.kernel.org



> Paul Eggert <eggert@cs.ucla.edu> hat am 27. Juni 2018 um 21:46 geschrieben:
> 
> 
> Paul Eggert wrote:
> > We could distinguish "time zone" in the usual English-language sense (a set
> > of 
> > geographic locations that currently share the same standard time offset from
> > 
> > UTC) from "timezone" in the POSIX sense (a history and predicted future of
> > UTC 
> > offsets, abbreviations and isdst flags). If so, the tzdb documentation could
> > be 
> > more careful about using "time zone" for the former and "timezone" for the 
> > latter, and this would make for fewer changes to the GNU/Linux man-pages for
> > 
> > tzdb. I can look into this and propose an updated set of tzdb-related
> > patches 
> > accordingly.
> 
> I've done that, plus a few other minor fixups, and have installed the attached
> 
> proposed patches into the development tzdb repository on GitHub. I plan to 
> follow up by emailing to linux-man a corresponding set of patches to the 
> GNU/Linux man pages.

I would suggest adding a glossary with "timezone" and  "time zone". In a few
years everyone will have forgotten about this and everyone is confused why
this was done.

re,
 wh
