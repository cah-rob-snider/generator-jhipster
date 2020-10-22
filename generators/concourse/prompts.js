/**
 * Copyright 2013-2020 the original author or authors from the JHipster project.
 *
 * This file is part of the JHipster project, see https://www.jhipster.tech/
 * for more information.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
const _ = require('lodash');

module.exports = {
    prompting,
};

function prompting() {
    const done = this.async();
    const prompts = [
        {
            name: 'pipelineName',
            validate: input => /\b([A-Z][a-z]+)+/.test(input)
                ? true
                : 'The pipeline name must be PascalCased (e.g. MyNewApp)',
            message: 'The name of the concourse pipeline',
            default: this.getPrettyNameNoSpaces(),
        },
        {
            name: 'vaultKey',
            validate: input => /^[A-Z_]+$/.test(input)
                ? true
                : 'The vault key must be all caps and may contain underscores',
            message: 'The name of the vault key',
            default: `${this.getPrettyNameCapsLodash()}_COMMON`,
        },
    ];

    this.prompt(prompts).then(props => {
        this.pipelineName = props.pipelineName;
        this.vaultKey = props.vaultKey;

        done();
    });
}
